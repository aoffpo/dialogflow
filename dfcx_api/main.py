from  manage_pages import DF_Pages
import asyncio
from google.cloud.dialogflowcx_v3 import SessionsClient
from google.api_core import client_options

operator_mappings = {
    "=": "!=",
    "!=": "=",
    ">": "<",
    "<": ">",
    ">=": "<=",
    "<=": ">=",
}


def convert_true_routes(routes):
    for route in routes:
        condition_index = len(route) -1

        condition_info = route[condition_index].condition

        if (condition_info == "true"):
            previous_condition = route[condition_index-1].condition
            for operator in operator_mappings.keys():
                if operator in previous_condition:
                    condition = previous_condition.replace(operator, operator_mappings[operator]) 
                    route[condition_index].condition = condition


async def main():    
    pages_to_retrieve = ["d095605e-0bb6-440f-bd56-865a23000db0", 
                         "2e2f0773-e6d1-4af4-9838-e7338da8b416", 
                         "8d986159-4aea-4370-a7b3-05d2d5ff865a"]
    project_id = "dialogflow-371521" 
    agent_id = "71a127f4-46a9-43ee-89b1-a82cdbf942ef"
    flow_id = "00000000-0000-0000-0000-000000000000" 
    location = "us-east1"

    df_pages = DF_Pages()

    # get pages
    # pages = await asyncio.gather(manage_pages.get_page(project_id, agent_id, flow_id, location, page) for page in pages_to_retrieve)
    pages = [await df_pages.get_page(project_id, agent_id, flow_id, location, page) for page in pages_to_retrieve]
    
    # get fulfillments
    all_fulfillments = []
    all_routes = []
    all_route_groups = []
    all_parameters = []
    all_event_handlers = []
    for page in pages:
        print(page.display_name)

        all_fulfillments.append(page.entry_fulfillment)
        all_route_groups.append(page.transition_route_groups)
        all_routes.append(page.transition_routes)
        convert_true_routes(all_routes)
        all_parameters.append(page.form.parameters)
        all_event_handlers.append(page.event_handlers)
        # get webhooks...or they are already in the fulfillments collection

    # create new page
    request = df_pages.create_page_request(project_id,
                                           agent_id,
                                           flow_id,
                                           location,
                                           'ConsolidatedPage')

    # add object collections to page
    request.page.entry_fulfillment = df_pages.consolidate_fulfillments(all_fulfillments)
    request.page.transition_route_groups =  df_pages.consolidate_route_groups(all_route_groups)
    request.page.transition_routes = df_pages.consolidate_routes(all_routes)
    request.page.event_handlers =  df_pages.consolidate_event_handlers(all_event_handlers)

    response = await df_pages.send_page_request(request)
    print(response)

    # document original pages

    # delete original pages



if __name__ == "__main__":
    options = client_options.ClientOptions(api_endpoint="us-east1-dialogflow.googleapis.com:443")
    session_client = SessionsClient(credentials=None, transport=None,client_options=options)
    asyncio.run(main())