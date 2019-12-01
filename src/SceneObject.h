#pragma once

#include <string>
#include "glm/vec3.hpp"

#include "basetypes.h"

class SceneObject {
public:
    virtual Intersection intersection(glm::vec3, glm::vec3);
    virtual glm::vec3 normal(glm::vec3, glm::vec3, glm::vec3);
    std::string material_name;
};
