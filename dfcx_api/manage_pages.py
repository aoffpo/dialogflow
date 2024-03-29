from google.api_core import client_options
from google.cloud.dialogflowcx_v3 import (
    #EventHandler,
    Fulfillment,
    PagesAsyncClient, 
    TransitionRouteGroup
)
from google.cloud.dialogflowcx_v3.types.page import (
    CreatePageRequest,
    DeletePageRequest,
    GetPageRequest,
    ListPagesRequest,
    Page
)

import json

class DF_Pages:

    def __init__(self):
        options = client_options.ClientOptions(api_endpoint="us-east1-dialogflow.googleapis.com:443")
        self.pages_client = PagesAsyncClient(client_options=options)

    # [START dialogflow_cx_create_page]
    def create_page_request(self, project_id, agent_id, flow_id, location, display_name):
        page = Page()
        page.display_name = display_name

        request = CreatePageRequest()
        request.parent = (
            "projects/"
            + project_id
            + "/locations/"
            + location
            + "/agents/"
            + agent_id
            + "/flows/"
            + flow_id
        )
        request.page = page
        print(f"created request for {display_name}")
        return request

    async def send_page_request(self, page_request):
        response = await self.pages_client.create_page(request=page_request)
        return response

    async def get_page(self, project_id, agent_id, flow_id, location, page_guid):
        request = GetPageRequest()
        request.name = \
            "projects/" \
            + project_id \
            + "/locations/" \
            + location \
            + "/agents/" \
            + agent_id \
            + "/flows/" \
            + flow_id \
            + "/pages/" \
            + page_guid

        return await self.pages_client.get_page(request=request)

    async def list_page(self, project_id, agent_id, flow_id, location):
        pages_client = PagesAsyncClient()

        request = ListPagesRequest()
        request.parent = (
            f"projects/{project_id}/locations/{location}/agents/{agent_id}/flows/{flow_id}"
        )

        request.language_code = "en"

        response = await self.pages_client.list_pages(request=request)
        return response

    async def delete_page(self, project_id, agent_id, flow_id, page_id, location):
        pages_client = PagesAsyncClient()

        request = DeletePageRequest()
        request.name = f"projects/{project_id}/locations/{location}/agents/{agent_id}/flows/{flow_id}/pages/{page_id}"

        response = await self.pages_client.delete_page(request=request)
        return response

    # [END dialogflow_cx_delete_page]

    def consolidate_fulfillments(self, fulfillments):
        fulfillment = Fulfillment()

        for f in fulfillments:
            if (len(f.messages) > 0):
                fulfillment.messages.append(f.messages[0])

        # fulfillment.messages.append([f.messages[0] for f in fulfillments if len(f.messages) >0 ]) # TODO: better handling
        # assume only one page has a webhook since we wouldn't consolidate pages with their own webhooks
        fulfillment.webhook = next((f.webhook for f in fulfillments if f.webhook != ''), None)
        fulfillment.tag  = next((f.tag for f in fulfillments if f.tag != ''), None)
        
        return fulfillment

    def consolidate_route_groups(self, route_groups):
        rg = TransitionRouteGroup()
        for group in route_groups:
            if len(group) >0:
                rg.append(group)
        return rg

    def consolidate_routes(self, routes):
        transition_routes  = []
        # transition_routes = [[transition_routes.append(val) for val in r] for r in routes]
        for r in routes:
           for val in r:
                transition_routes.append(val)
        return transition_routes

    def consolidate_event_handlers(self, handlers):
        event_handlers  = []
        for h in handlers:
           for val in h:
                event_handlers.append(val) 
        return event_handlers

    def add_json_to_fulfillment_preset(self, payload):
         fulfillment = Fulfillment()

         parameter = { "parameter": "QueryAccountByPhone",
                       "value": json.dumps(payload)}
         fulfillment.set_parameter_actions.append(parameter)
         return fulfillment

    #def increment_variable_on_route()

   