/*
 * Student License - for use by students to meet course requirements and
 * perform academic research at degree granting institutions only.  Not
 * for government, commercial, or other organizational use.
 *
 * dpqs.c
 *
 * Code generation for function 'dpqs'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "dpqs.h"
#include "dpqs_data.h"

/* Variable Definitions */
static emlrtRSInfo emlrtRSI = { 4,     /* lineNo */
  "dpqs",                              /* fcnName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m"/* pathName */
};

static emlrtRSInfo b_emlrtRSI = { 105, /* lineNo */
  "dpqs",                              /* fcnName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m"/* pathName */
};

static emlrtRSInfo c_emlrtRSI = { 106, /* lineNo */
  "dpqs",                              /* fcnName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m"/* pathName */
};

static emlrtRSInfo d_emlrtRSI = { 107, /* lineNo */
  "dpqs",                              /* fcnName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m"/* pathName */
};

static emlrtRTEInfo b_emlrtRTEI = { 26,/* lineNo */
  11,                                  /* colNo */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m"/* pName */
};

static emlrtRTEInfo c_emlrtRTEI = { 64,/* lineNo */
  12,                                  /* colNo */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m"/* pName */
};

static emlrtBCInfo emlrtBCI = { -1,    /* iFirst */
  -1,                                  /* iLast */
  28,                                  /* lineNo */
  13,                                  /* colNo */
  "array",                             /* aName */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo b_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  28,                                  /* lineNo */
  24,                                  /* colNo */
  "array",                             /* aName */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo c_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  51,                                  /* lineNo */
  18,                                  /* colNo */
  "array",                             /* aName */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo d_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  52,                                  /* lineNo */
  33,                                  /* colNo */
  "array",                             /* aName */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo e_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  52,                                  /* lineNo */
  12,                                  /* colNo */
  "array",                             /* aName */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo f_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  53,                                  /* lineNo */
  12,                                  /* colNo */
  "array",                             /* aName */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo g_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  30,                                  /* lineNo */
  18,                                  /* colNo */
  "array",                             /* aName */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo h_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  30,                                  /* lineNo */
  41,                                  /* colNo */
  "array",                             /* aName */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo i_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  44,                                  /* lineNo */
  18,                                  /* colNo */
  "array",                             /* aName */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo j_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  45,                                  /* lineNo */
  33,                                  /* colNo */
  "array",                             /* aName */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo k_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  45,                                  /* lineNo */
  12,                                  /* colNo */
  "array",                             /* aName */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo l_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  46,                                  /* lineNo */
  23,                                  /* colNo */
  "array",                             /* aName */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo m_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  46,                                  /* lineNo */
  12,                                  /* colNo */
  "array",                             /* aName */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo n_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  47,                                  /* lineNo */
  12,                                  /* colNo */
  "array",                             /* aName */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo o_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  66,                                  /* lineNo */
  14,                                  /* colNo */
  "array",                             /* aName */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo p_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  66,                                  /* lineNo */
  25,                                  /* colNo */
  "array",                             /* aName */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo q_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  92,                                  /* lineNo */
  19,                                  /* colNo */
  "array",                             /* aName */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo r_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  93,                                  /* lineNo */
  34,                                  /* colNo */
  "array",                             /* aName */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo s_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  93,                                  /* lineNo */
  13,                                  /* colNo */
  "array",                             /* aName */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo t_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  94,                                  /* lineNo */
  13,                                  /* colNo */
  "array",                             /* aName */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo u_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  70,                                  /* lineNo */
  19,                                  /* colNo */
  "array",                             /* aName */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo v_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  70,                                  /* lineNo */
  42,                                  /* colNo */
  "array",                             /* aName */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo w_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  85,                                  /* lineNo */
  19,                                  /* colNo */
  "array",                             /* aName */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo x_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  86,                                  /* lineNo */
  34,                                  /* colNo */
  "array",                             /* aName */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo y_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  86,                                  /* lineNo */
  13,                                  /* colNo */
  "array",                             /* aName */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo ab_emlrtBCI = { -1, /* iFirst */
  -1,                                  /* iLast */
  87,                                  /* lineNo */
  24,                                  /* colNo */
  "array",                             /* aName */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo bb_emlrtBCI = { -1, /* iFirst */
  -1,                                  /* iLast */
  87,                                  /* lineNo */
  13,                                  /* colNo */
  "array",                             /* aName */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo cb_emlrtBCI = { -1, /* iFirst */
  -1,                                  /* iLast */
  88,                                  /* lineNo */
  13,                                  /* colNo */
  "array",                             /* aName */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo db_emlrtBCI = { -1, /* iFirst */
  -1,                                  /* iLast */
  72,                                  /* lineNo */
  20,                                  /* colNo */
  "array",                             /* aName */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo eb_emlrtBCI = { -1, /* iFirst */
  -1,                                  /* iLast */
  73,                                  /* lineNo */
  35,                                  /* colNo */
  "array",                             /* aName */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo fb_emlrtBCI = { -1, /* iFirst */
  -1,                                  /* iLast */
  73,                                  /* lineNo */
  14,                                  /* colNo */
  "array",                             /* aName */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo gb_emlrtBCI = { -1, /* iFirst */
  -1,                                  /* iLast */
  74,                                  /* lineNo */
  14,                                  /* colNo */
  "array",                             /* aName */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo hb_emlrtBCI = { -1, /* iFirst */
  -1,                                  /* iLast */
  31,                                  /* lineNo */
  19,                                  /* colNo */
  "array",                             /* aName */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo ib_emlrtBCI = { -1, /* iFirst */
  -1,                                  /* iLast */
  32,                                  /* lineNo */
  34,                                  /* colNo */
  "array",                             /* aName */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo jb_emlrtBCI = { -1, /* iFirst */
  -1,                                  /* iLast */
  32,                                  /* lineNo */
  13,                                  /* colNo */
  "array",                             /* aName */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo kb_emlrtBCI = { -1, /* iFirst */
  -1,                                  /* iLast */
  33,                                  /* lineNo */
  13,                                  /* colNo */
  "array",                             /* aName */
  "dpqs",                              /* fName */
  "C:\\workspace\\matlab\\myfunctions\\dpqs.m",/* pName */
  0                                    /* checkKind */
};

/* Function Declarations */
static void DPQSWorker(const emlrtStack *sp, emxArray_real_T *array, real_T
  lowerBound, real_T upperBound);

/* Function Definitions */
static void DPQSWorker(const emlrtStack *sp, emxArray_real_T *array, real_T
  lowerBound, real_T upperBound)
{
  real_T pivot1Index;
  real_T pivot2Index;
  real_T prevIndex1;
  real_T prevIndex2;
  boolean_T run;
  int32_T i1;
  int32_T i;
  boolean_T exitg1;
  real_T b_i;
  int32_T i2;
  int32_T i3;
  int32_T i4;
  int32_T exitg2;
  real_T tmp;
  emlrtStack st;
  st.prev = sp;
  st.tls = sp->tls;
  if (*emlrtBreakCheckR2012bFlagVar != 0) {
    emlrtBreakCheckR2012b(sp);
  }

  if (!(upperBound <= lowerBound)) {
    pivot1Index = lowerBound;
    pivot2Index = upperBound;
    prevIndex1 = upperBound;
    prevIndex2 = lowerBound;
    run = true;
    while (run) {
      run = false;
      i1 = (int32_T)(((pivot1Index + 1.0) + (-1.0 - prevIndex1)) / -1.0);
      emlrtForLoopVectorCheckR2012b(prevIndex1, -1.0, pivot1Index + 1.0,
        mxDOUBLE_CLASS, i1, &b_emlrtRTEI, sp);
      i = 0;
      exitg1 = false;
      while ((!exitg1) && (i <= i1 - 1)) {
        b_i = prevIndex1 + -(real_T)i;
        i2 = array->size[0];
        i3 = (int32_T)b_i;
        if (!((i3 >= 1) && (i3 <= i2))) {
          emlrtDynamicBoundsCheckR2012b(i3, 1, i2, &emlrtBCI, sp);
        }

        i2 = array->size[0];
        i4 = (int32_T)pivot1Index;
        if (!((i4 >= 1) && (i4 <= i2))) {
          emlrtDynamicBoundsCheckR2012b(i4, 1, i2, &b_emlrtBCI, sp);
        }

        if (array->data[i3 - 1] < array->data[i4 - 1]) {
          if (b_i != pivot2Index) {
            do {
              exitg2 = 0;
              i1 = array->size[0];
              i2 = (int32_T)(pivot1Index + 1.0);
              if (!((i2 >= 1) && (i2 <= i1))) {
                emlrtDynamicBoundsCheckR2012b(i2, 1, i1, &g_emlrtBCI, sp);
              }

              i1 = array->size[0];
              i3 = (int32_T)pivot1Index;
              if (!((i3 >= 1) && (i3 <= i1))) {
                emlrtDynamicBoundsCheckR2012b(i3, 1, i1, &h_emlrtBCI, sp);
              }

              if (array->data[i2 - 1] < array->data[i3 - 1]) {
                i1 = array->size[0];
                i2 = (int32_T)pivot1Index;
                if (!((i2 >= 1) && (i2 <= i1))) {
                  emlrtDynamicBoundsCheckR2012b(i2, 1, i1, &hb_emlrtBCI, sp);
                }

                tmp = array->data[i2 - 1];
                i1 = array->size[0];
                i2 = (int32_T)(pivot1Index + 1.0);
                if (!((i2 >= 1) && (i2 <= i1))) {
                  emlrtDynamicBoundsCheckR2012b(i2, 1, i1, &ib_emlrtBCI, sp);
                }

                i1 = array->size[0];
                i3 = (int32_T)pivot1Index;
                if (!((i3 >= 1) && (i3 <= i1))) {
                  emlrtDynamicBoundsCheckR2012b(i3, 1, i1, &jb_emlrtBCI, sp);
                }

                array->data[i3 - 1] = array->data[i2 - 1];
                i1 = array->size[0];
                i2 = (int32_T)(pivot1Index + 1.0);
                if (!((i2 >= 1) && (i2 <= i1))) {
                  emlrtDynamicBoundsCheckR2012b(i2, 1, i1, &kb_emlrtBCI, sp);
                }

                array->data[i2 - 1] = tmp;
                pivot1Index++;
                if (pivot1Index > prevIndex2) {
                  prevIndex2 = pivot1Index;
                }

                if (*emlrtBreakCheckR2012bFlagVar != 0) {
                  emlrtBreakCheckR2012b(sp);
                }
              } else {
                exitg2 = 1;
              }
            } while (exitg2 == 0);

            if (b_i <= pivot1Index) {
            } else {
              i1 = array->size[0];
              i2 = (int32_T)pivot1Index;
              if (!((i2 >= 1) && (i2 <= i1))) {
                emlrtDynamicBoundsCheckR2012b(i2, 1, i1, &i_emlrtBCI, sp);
              }

              tmp = array->data[i2 - 1];
              i1 = array->size[0];
              i2 = (int32_T)b_i;
              if (!((i2 >= 1) && (i2 <= i1))) {
                emlrtDynamicBoundsCheckR2012b(i2, 1, i1, &j_emlrtBCI, sp);
              }

              i1 = array->size[0];
              i3 = (int32_T)pivot1Index;
              if (!((i3 >= 1) && (i3 <= i1))) {
                emlrtDynamicBoundsCheckR2012b(i3, 1, i1, &k_emlrtBCI, sp);
              }

              array->data[i3 - 1] = array->data[i2 - 1];
              i1 = array->size[0];
              i2 = (int32_T)(pivot1Index + 1.0);
              if (!((i2 >= 1) && (i2 <= i1))) {
                emlrtDynamicBoundsCheckR2012b(i2, 1, i1, &l_emlrtBCI, sp);
              }

              i1 = array->size[0];
              i3 = (int32_T)b_i;
              if (!((i3 >= 1) && (i3 <= i1))) {
                emlrtDynamicBoundsCheckR2012b(i3, 1, i1, &m_emlrtBCI, sp);
              }

              array->data[i3 - 1] = array->data[i2 - 1];
              i1 = array->size[0];
              i2 = (int32_T)(pivot1Index + 1.0);
              if (!((i2 >= 1) && (i2 <= i1))) {
                emlrtDynamicBoundsCheckR2012b(i2, 1, i1, &n_emlrtBCI, sp);
              }

              array->data[i2 - 1] = tmp;
              pivot1Index++;
              prevIndex1 = b_i;
              run = true;
            }
          } else {
            i1 = array->size[0];
            i2 = (int32_T)pivot1Index;
            if (!((i2 >= 1) && (i2 <= i1))) {
              emlrtDynamicBoundsCheckR2012b(i2, 1, i1, &c_emlrtBCI, sp);
            }

            tmp = array->data[i2 - 1];
            i1 = array->size[0];
            i2 = (int32_T)pivot2Index;
            if (!((i2 >= 1) && (i2 <= i1))) {
              emlrtDynamicBoundsCheckR2012b(i2, 1, i1, &d_emlrtBCI, sp);
            }

            i1 = array->size[0];
            i3 = (int32_T)pivot1Index;
            if (!((i3 >= 1) && (i3 <= i1))) {
              emlrtDynamicBoundsCheckR2012b(i3, 1, i1, &e_emlrtBCI, sp);
            }

            array->data[i3 - 1] = array->data[i2 - 1];
            i1 = array->size[0];
            i2 = (int32_T)pivot2Index;
            if (!((i2 >= 1) && (i2 <= i1))) {
              emlrtDynamicBoundsCheckR2012b(i2, 1, i1, &f_emlrtBCI, sp);
            }

            array->data[i2 - 1] = tmp;
            run = true;
          }

          exitg1 = true;
        } else {
          i++;
          if (*emlrtBreakCheckR2012bFlagVar != 0) {
            emlrtBreakCheckR2012b(sp);
          }
        }
      }

      i1 = (int32_T)((pivot2Index - 1.0) + (1.0 - prevIndex2));
      emlrtForLoopVectorCheckR2012b(prevIndex2, 1.0, pivot2Index - 1.0,
        mxDOUBLE_CLASS, i1, &c_emlrtRTEI, sp);
      i = 0;
      exitg1 = false;
      while ((!exitg1) && (i <= i1 - 1)) {
        b_i = prevIndex2 + (real_T)i;
        i2 = array->size[0];
        i3 = (int32_T)b_i;
        if (!((i3 >= 1) && (i3 <= i2))) {
          emlrtDynamicBoundsCheckR2012b(i3, 1, i2, &o_emlrtBCI, sp);
        }

        i2 = array->size[0];
        i4 = (int32_T)pivot2Index;
        if (!((i4 >= 1) && (i4 <= i2))) {
          emlrtDynamicBoundsCheckR2012b(i4, 1, i2, &p_emlrtBCI, sp);
        }

        if (array->data[i3 - 1] > array->data[i4 - 1]) {
          if (b_i != pivot1Index) {
            do {
              exitg2 = 0;
              i1 = array->size[0];
              i2 = (int32_T)(pivot2Index - 1.0);
              if (!((i2 >= 1) && (i2 <= i1))) {
                emlrtDynamicBoundsCheckR2012b(i2, 1, i1, &u_emlrtBCI, sp);
              }

              i1 = array->size[0];
              i3 = (int32_T)pivot2Index;
              if (!((i3 >= 1) && (i3 <= i1))) {
                emlrtDynamicBoundsCheckR2012b(i3, 1, i1, &v_emlrtBCI, sp);
              }

              if (array->data[i2 - 1] > array->data[i3 - 1]) {
                i1 = array->size[0];
                i2 = (int32_T)pivot2Index;
                if (!((i2 >= 1) && (i2 <= i1))) {
                  emlrtDynamicBoundsCheckR2012b(i2, 1, i1, &db_emlrtBCI, sp);
                }

                tmp = array->data[i2 - 1];
                i1 = array->size[0];
                i2 = (int32_T)(pivot2Index - 1.0);
                if (!((i2 >= 1) && (i2 <= i1))) {
                  emlrtDynamicBoundsCheckR2012b(i2, 1, i1, &eb_emlrtBCI, sp);
                }

                i1 = array->size[0];
                i3 = (int32_T)pivot2Index;
                if (!((i3 >= 1) && (i3 <= i1))) {
                  emlrtDynamicBoundsCheckR2012b(i3, 1, i1, &fb_emlrtBCI, sp);
                }

                array->data[i3 - 1] = array->data[i2 - 1];
                i1 = array->size[0];
                i2 = (int32_T)(pivot2Index - 1.0);
                if (!((i2 >= 1) && (i2 <= i1))) {
                  emlrtDynamicBoundsCheckR2012b(i2, 1, i1, &gb_emlrtBCI, sp);
                }

                array->data[i2 - 1] = tmp;
                pivot2Index--;
                if (pivot2Index < prevIndex1) {
                  prevIndex1 = pivot2Index;
                }

                if (*emlrtBreakCheckR2012bFlagVar != 0) {
                  emlrtBreakCheckR2012b(sp);
                }
              } else {
                exitg2 = 1;
              }
            } while (exitg2 == 0);

            if (b_i >= pivot2Index) {
            } else {
              i1 = array->size[0];
              i2 = (int32_T)pivot2Index;
              if (!((i2 >= 1) && (i2 <= i1))) {
                emlrtDynamicBoundsCheckR2012b(i2, 1, i1, &w_emlrtBCI, sp);
              }

              tmp = array->data[i2 - 1];
              i1 = array->size[0];
              i2 = (int32_T)b_i;
              if (!((i2 >= 1) && (i2 <= i1))) {
                emlrtDynamicBoundsCheckR2012b(i2, 1, i1, &x_emlrtBCI, sp);
              }

              i1 = array->size[0];
              i3 = (int32_T)pivot2Index;
              if (!((i3 >= 1) && (i3 <= i1))) {
                emlrtDynamicBoundsCheckR2012b(i3, 1, i1, &y_emlrtBCI, sp);
              }

              array->data[i3 - 1] = array->data[i2 - 1];
              i1 = array->size[0];
              i2 = (int32_T)(pivot2Index - 1.0);
              if (!((i2 >= 1) && (i2 <= i1))) {
                emlrtDynamicBoundsCheckR2012b(i2, 1, i1, &ab_emlrtBCI, sp);
              }

              i1 = array->size[0];
              i3 = (int32_T)b_i;
              if (!((i3 >= 1) && (i3 <= i1))) {
                emlrtDynamicBoundsCheckR2012b(i3, 1, i1, &bb_emlrtBCI, sp);
              }

              array->data[i3 - 1] = array->data[i2 - 1];
              i1 = array->size[0];
              i2 = (int32_T)(pivot2Index - 1.0);
              if (!((i2 >= 1) && (i2 <= i1))) {
                emlrtDynamicBoundsCheckR2012b(i2, 1, i1, &cb_emlrtBCI, sp);
              }

              array->data[i2 - 1] = tmp;
              pivot2Index--;
              prevIndex2 = b_i;
              run = true;
            }
          } else {
            i1 = array->size[0];
            i2 = (int32_T)pivot2Index;
            if (!((i2 >= 1) && (i2 <= i1))) {
              emlrtDynamicBoundsCheckR2012b(i2, 1, i1, &q_emlrtBCI, sp);
            }

            tmp = array->data[i2 - 1];
            i1 = array->size[0];
            i2 = (int32_T)pivot1Index;
            if (!((i2 >= 1) && (i2 <= i1))) {
              emlrtDynamicBoundsCheckR2012b(i2, 1, i1, &r_emlrtBCI, sp);
            }

            i1 = array->size[0];
            i3 = (int32_T)pivot2Index;
            if (!((i3 >= 1) && (i3 <= i1))) {
              emlrtDynamicBoundsCheckR2012b(i3, 1, i1, &s_emlrtBCI, sp);
            }

            array->data[i3 - 1] = array->data[i2 - 1];
            i1 = array->size[0];
            i2 = (int32_T)pivot1Index;
            if (!((i2 >= 1) && (i2 <= i1))) {
              emlrtDynamicBoundsCheckR2012b(i2, 1, i1, &t_emlrtBCI, sp);
            }

            array->data[i2 - 1] = tmp;
            run = true;
          }

          exitg1 = true;
        } else {
          i++;
          if (*emlrtBreakCheckR2012bFlagVar != 0) {
            emlrtBreakCheckR2012b(sp);
          }
        }
      }

      if (*emlrtBreakCheckR2012bFlagVar != 0) {
        emlrtBreakCheckR2012b(sp);
      }
    }

    st.site = &b_emlrtRSI;
    DPQSWorker(&st, array, lowerBound, pivot1Index - 1.0);
    st.site = &c_emlrtRSI;
    DPQSWorker(&st, array, pivot1Index + 1.0, pivot2Index - 1.0);
    st.site = &d_emlrtRSI;
    DPQSWorker(&st, array, pivot2Index + 1.0, upperBound);
  }
}

void dpqs(const emlrtStack *sp, emxArray_real_T *array)
{
  int32_T i0;
  emlrtStack st;
  st.prev = sp;
  st.tls = sp->tls;

  /* DPQS Implements a dual pivot quick sort */
  i0 = array->size[0];
  st.site = &emlrtRSI;
  DPQSWorker(&st, array, 1.0, i0);
}

/* End of code generation (dpqs.c) */
