# Copyright (C) 2017 The Android Open Source Project
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

LOCAL_PATH := $(call my-dir)

###
### Wrapper binary.
###
include $(CLEAR_VARS)

LOCAL_CFLAGS := -Wall -Werror
LOCAL_CLANG := true
LOCAL_MODULE := netutils-wrapper-1.0
LOCAL_SHARED_LIBRARIES := libc libbase liblog
LOCAL_SRC_FILES := NetUtilsWrapper-1.0.cpp main.cpp
LOCAL_MODULE_CLASS := EXECUTABLES

LOCAL_POST_INSTALL_CMD := $(hide) mkdir -p $(TARGET_OUT)/bin; \
    ln -sf netutils-wrapper-1.0 $(TARGET_OUT)/bin/iptables-wrapper-1.0; \
    ln -sf netutils-wrapper-1.0 $(TARGET_OUT)/bin/ip6tables-wrapper-1.0; \
    ln -sf netutils-wrapper-1.0 $(TARGET_OUT)/bin/ndc-wrapper-1.0; \
    ln -sf netutils-wrapper-1.0 $(TARGET_OUT)/bin/tc-wrapper-1.0; \
    ln -sf netutils-wrapper-1.0 $(TARGET_OUT)/bin/ip-wrapper-1.0;

include $(BUILD_EXECUTABLE)

###
### Wrapper unit tests.
###
include $(CLEAR_VARS)

LOCAL_CFLAGS := -Wall -Werror
LOCAL_CLANG := true
LOCAL_MODULE := netutils_wrapper_test
LOCAL_SHARED_LIBRARIES := libc libbase liblog
LOCAL_SRC_FILES := NetUtilsWrapper-1.0.cpp NetUtilsWrapperTest-1.0.cpp
LOCAL_MODULE_CLASS := NATIVE_TESTS

include $(BUILD_NATIVE_TEST)
