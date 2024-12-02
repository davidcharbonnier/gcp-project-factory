/**
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

# tfdoc:file:description Project factory.

module "projects" {
  source = "git@github.com:GoogleCloudPlatform/cloud-foundation-fabric.git//modules/project-factory?ref=v30.0.0"
  data_defaults = {
    billing_account = var.billing_account.id
    # more defaults are available, check the project factory variables
  }
  data_merges = {
    labels = {
      environment = "dev"
    }
    services = [
      "stackdriver.googleapis.com"
    ]
  }
  data_overrides = {
    prefix = "${var.prefix}-dev"
  }
  factories_config = var.factories_config
}


