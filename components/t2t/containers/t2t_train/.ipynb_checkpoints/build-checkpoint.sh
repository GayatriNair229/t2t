#!/bin/bash -e
# Copyright 2018 Google Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


if [ -z "$1" ]
  then
    PROJECT_ID=$(gcloud config config-helper --format "value(configuration.properties.core.project)")
else
  PROJECT_ID=$1
fi
ls
# # build base image
# pushd components/t2t/containers/base
# ./build.sh
# popd

# echo "hi"
docker build -t gayatrinair/ml-pipeline-t2ttrain . -f components/t2t/containers/t2t_train/Dockerfile
docker tag ml-pipeline-t2ttrain gayatrinair/ml-pipeline-t2ttrain
docker push gayatrinair/ml-pipeline-t2ttrain

