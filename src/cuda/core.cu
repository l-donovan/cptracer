#include "math.h"
#include "../glm/glm.hpp"
#include "../glm/vec3.hpp"

#include "core.h"
#include "../basetypes.h"
#include "../SceneObject.h"

using glm::vec3;

__global__
void add(int n, float *x) {
}

namespace core {
    vec3 reflect(vec3 d, vec3 n) {
        return d - (n * glm::dot(d, n) * 2.0f);
    }

    vec3 refract(vec3 d, vec3 n, float ior) {
        float cosi = glm::dot(d, n);
        float etai = 1.0f;
        float etat = ior;

        if (cosi > 0.0f) {
            float t = etai;
            etai = etat;
            etat = t;
            n = -n;
        } else {
            cosi = -cosi;
        }

        float eta = etai / etat;
        float k = 1.0f - eta * eta * (1.0f - cosi * cosi);

        if (k < 0.0f) {
            return vec3(0.0f);
        } else {
            return d * eta + n * (eta * cosi - sqrt(k));
        }
    }

    float fresnel(vec3 d, vec3 n, float ior) {
        float cosi = glm::dot(d, n);
        float etai = 1.0f;
        float etat = ior;

        if (cosi > 0.0f) {
            float t = etai;
            etai = etat;
            etat = t;
        }

        float sint = etai / etat * sqrt(max(1.0f - cosi * cosi, 0.0f));

        if (sint >= 1.0f) {
            return 1.0f;
        } else {
            float cost = sqrt(max(1.0f - sint * sint, 0.0f));
            cosi = abs(cosi);
            float rs = (etat * cosi - etai * cost) / (etat * cosi + etai * cost);
            float rp = (etai * cosi - etat * cost) / (etai * cosi + etat * cost);
            return (rs * rs + rp * rp) / 2.0f;
        }
    }

    Intersection check_intersection(vec3 origin, vec3 dir, SceneObject *objects) {
    }

    // TODO Intersection

    vec3 cast_ray(vec3 pos, vec3 dir, Options options) {
        vec3 color(0.0f);
        vec3 throughput(1.0f);

        for (int i = 0; i < options.max_depth; ++i) {
            Intersection inter;
        }

        return color;
    }

    int test(int n) {
        return n;
    }
}
