# Copyright 2017 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

LOCAL_CPP_EXTENSION := .cc

LOCAL_SRC_FILES += \
	cros_gralloc/cros_gralloc_buffer.cc \
	cros_gralloc/cros_gralloc_driver.cc \
	cros_gralloc/cros_gralloc_helpers.cc \
	cros_gralloc/i915_private_android.cc

ifeq ($(strip $(BOARD_USES_GRALLOC1)), true)
LOCAL_SRC_FILES += cros_gralloc/gralloc1/cros_gralloc1_module.cc
LOCAL_CPPFLAGS += -DUSE_GRALLOC1
LOCAL_CFLAGS += -DUSE_GRALLOC1  -DLOG_TAG=\"gralloc1\"
else
LOCAL_SRC_FILES += cros_gralloc/gralloc0/gralloc0.cc
LOCAL_CFLAGS += -DLOG_TAG=\"gralloc\"
endif
