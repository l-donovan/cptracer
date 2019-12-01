#pragma once

#include "../glm/vec3.hpp"

namespace core {
    int test(int);
    glm::vec3 reflect(glm::vec3, glm::vec3);
    glm::vec3 refract(glm::vec3, glm::vec3, float);
    float     fresnel(glm::vec3, glm::vec3, float);
}
