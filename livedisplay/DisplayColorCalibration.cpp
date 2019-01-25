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

#include "DisplayColorCalibration.h"
#include <fstream>

namespace vendor {
namespace lineage {
namespace livedisplay {
namespace V2_0 {
namespace implementation {

static constexpr const char *kColorPath = "/sys/class/graphics/fb0/rgb";

Return<int32_t> DisplayColorCalibration::getMaxValue() {
    return 32768;
}

Return<int32_t> DisplayColorCalibration::getMinValue() {
    return 255;
}

Return<void> DisplayColorCalibration::getCalibration(getCalibration_cb resultCb) {
    std::ifstream file(kColorPath);
    int r, g, b;

    file >> r >> g >> b;
    if (file.fail()) {
        resultCb(std::vector<int32_t>());
    } else {
        resultCb(std::vector<int32_t>({ r, g, b }));
    }

    return Void();
}

Return<bool> DisplayColorCalibration::setCalibration(const hidl_vec<int32_t>& rgb) {
    std::ofstream file(kColorPath);
    if (rgb.size() != 3) {
        return false;
    }

    file << rgb[0] << " " << rgb[1] << " "  << rgb[2];
    return !file.fail();
}

}  // namespace implementation
}  // namespace V2_0
}  // namespace livedisplay
}  // namespace lineage
}  // namespace vendor

