/*
 * Student License - for use by students to meet course requirements and
 * perform academic research at degree granting institutions only.  Not
 * for government, commercial, or other organizational use.
 *
 * dpqs_initialize.c
 *
 * Code generation for function 'dpqs_initialize'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "dpqs.h"
#include "dpqs_initialize.h"
#include "_coder_dpqs_mex.h"
#include "dpqs_data.h"

/* Function Definitions */
void dpqs_initialize(void)
{
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  mexFunctionCreateRootTLS();
  emlrtBreakCheckR2012bFlagVar = emlrtGetBreakCheckFlagAddressR2012b();
  st.tls = emlrtRootTLSGlobal;
  emlrtClearAllocCountR2012b(&st, false, 0U, 0);
  emlrtEnterRtStackR2012b(&st);
  emlrtFirstTimeR2012b(emlrtRootTLSGlobal);
}

/* End of code generation (dpqs_initialize.c) */
