/*
 * Copyright (C) 2018-2019 The LineageOS Project
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

#include "AdaptiveBacklight.h"
#include <fstream>

namespace vendor {
namespace lineage {
namespace livedisplay {
namespace V2_0 {
namespace implementation {

static constexpr const char *kCabcPath = "/sys/class/graphics/fb0/cabc";

Return<bool> AdaptiveBacklight::isEnabled() {
    std::ifstream file(kCabcPath);
    int result;

    file >> result;
    return !file.fail() && result > 0;
}

Return<bool> AdaptiveBacklight::setEnabled(bool enabled) {
    std::ofstream file(kCabcPath);
    file << (enabled ? "1" : "0");
    return !file.fail();
}

}  // namespace implementation
}  // namespace V2_0
}  // namespace livedisplay
}  // namespace lineage
}  // namespace vendor
