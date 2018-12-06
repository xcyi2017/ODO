//
//  Line.h
//
//

#ifndef Line_h
#define Line_h
#include <gravity/Arc.h>
#include "Bound.h"
#include "Bus.h"

// A line is an arc.
// It has additional physical properties.

class Line: public Arc {
public:
    double limit; 
    double ch;
    double tr;
    double as;
    double r;
    double x;
    double g;
    double b;
    double cc;
    double dd;
    double smax;
    double cost = 0;
    int status; // on /off, failure or not.
    unsigned b_type;
    double wr = 1.0;
    double wi = 0.0;
    Bound tbound;
    vector<Switch> _switches;
    //Complex _Si_;
    //Complex _Sj_;
    //Complex _W_;
//    var<>   wr;
//    var<>   wi;
//    var<>   pi;
//    var<>   qi;
//    var<>   pj;
//    var<>   qj;
//    var<>   vcs;    /** vi*vj*cs */
//    var<>   vsn;    /** vi*vj*sn */
//    var<>   vv;     /** vi*vj */
//    var<>   cs;     /** cos(thetai - thetaj - as) */
//    var<>   sn;     /** sin(thetai - thetaj - as) */
//    var<>   ci;     /** square of the current magnitude */
//    var<>   w_line_ij;
//    var<>   w_line_ji;
//    var<>   delta;
//    var<bool> on;
    Line();
    Line(std::string name);
    ~Line();
 //   void init_complex();
    void print();
};

#endif
