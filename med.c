#include "mex.h"
#define NUM_INPUT_ARGS 3

void mexFunction(int nlhs,mxArray *plhs[],int nrhs,const mxArray *prhs[])
{

	if (nrhs != NUM_INPUT_ARGS)
	{
		mexErrMsgIdAndTxt( "med:invalidNumInputs","Three input arguments are required.");
	}

	if(nlhs > 1)
	{
		mexErrMsgIdAndTxt("med:maxlhs","Too many output arguments.");
	}

	//make sure inputs are numeric scalars
	for(int i = 0; i < NUM_INPUT_ARGS; i++)
	{
		if(!(mxIsNumeric(prhs[i]) && mxIsScalar(prhs[i])))
		{
			mexErrMsgIdAndTxt( "med:invalidInputType","All input arguments must be numeric scalars.");
		}

		if(mxIsComplex(prhs[i]))
		{
			mexErrMsgIdAndTxt( "med:inputNonReal","All input arguments must be non-complex.");
		}
	}
	
	double a = mxGetScalar(prhs[0]);
	double b = mxGetScalar(prhs[1]);
	double c = mxGetScalar(prhs[2]);

	int x1 = a < b;
	int x2 = a < c;
	plhs[0] = x1 ^ x2 ? prhs[0] : (x1 ^ (c < b) ? prhs[1] : prhs[2]);
	

}