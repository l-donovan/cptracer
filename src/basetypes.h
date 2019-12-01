#pragma once

#include "glm/vec3.hpp"

struct Options {
    int max_depth, proc_count, sample_count;
    float bias = 0.00001;
};

struct Intersection {
    bool intersected;
    float distance;
    glm::vec3 position;
};
