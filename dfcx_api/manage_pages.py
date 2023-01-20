# Copyright 2021, Google LLC
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

from google.api_core import client_options
from google.cloud.dialogflowcx_v3 import PagesAsyncClient
from google.cloud.dialogflowcx_v3.types.page import (
    CreatePageRequest,
    DeletePageRequest,
    GetPageRequest,
    ListPagesRequest,
    Page,
)

class DF_Pages:

    def __init__(self):
        options = client_options.ClientOptions(api_endpoint="us-east1-dialogflow.googleapis.com:443")
        self.pages_client = PagesAsyncClient(client_options=options)


    # [START dialogflow_cx_create_page]
    async def create_page(self, project_id, agent_id, flow_id, location, displayName):

        page = Page()
        page.display_name = displayName

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

        response = await self.pages_client.create_page(request=request)
        return response


    # [END dialogflow_cx_create_page]

    async def get_page(self, project_id, agent_id, flow_id, location, page_guid):
        options = client_options.ClientOptions(api_endpoint="us-east1-dialogflow.googleapis.com:443")
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


    # [START dialogflow_cx_list_page]
    async def list_page(self, project_id, agent_id, flow_id, location):
        pages_client = PagesAsyncClient()

        request = ListPagesRequest()
        request.parent = (
            f"projects/{project_id}/locations/{location}/agents/{agent_id}/flows/{flow_id}"
        )

        request.language_code = "en"

        response = await self.pages_client.list_pages(request=request)
        return response


    # [END dialogflow_cx_list_page]


    # [START dialogflow_cx_delete_page]
    async def delete_page(self, project_id, agent_id, flow_id, page_id, location):
        pages_client = PagesAsyncClient()

        request = DeletePageRequest()
        request.name = f"projects/{project_id}/locations/{location}/agents/{agent_id}/flows/{flow_id}/pages/{page_id}"

        response = await self.pages_client.delete_page(request=request)
        return response


    # [END dialogflow_cx_delete_page]