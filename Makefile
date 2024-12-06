#
# Copyright (c) 2024 IOTech Ltd
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

.PHONY: test

docker:
	make -C ./app-service-template docker

lint:
	@which pylint >/dev/null || echo "WARNING: pylint not installed. To install, run make install-lint"
	pylint ./src

install-sdk:
	pip install .

install-lint:
	pip install pylint

test-template:
	make -C ./app-service-template test

test-sdk:
	python3 -m unittest discover -s tests -v

test: lint test-sdk test-template