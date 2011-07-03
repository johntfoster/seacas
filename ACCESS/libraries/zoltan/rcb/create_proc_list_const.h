/*****************************************************************************
 * Zoltan Library for Parallel Applications                                  *
 * Copyright (c) 2000,2001,2002, Sandia National Laboratories.               *
 * For more info, see the README file in the top-level Zoltan directory.     *  
 *****************************************************************************/
/*****************************************************************************
 * CVS File Information :
 *    $RCSfile: create_proc_list_const.h,v $
 *    $Author: gdsjaar $
 *    $Date: 2009/06/09 18:38:00 $
 *    Revision: 1.7 $
 ****************************************************************************/


#ifndef __CREATE_PROC_LIST_CONST_H
#define __CREATE_PROC_LIST_CONST_H

#ifdef __cplusplus
/* if C++, define the rest of this header file as extern C */
extern "C" {
#endif


/* function prototype */

extern int Zoltan_RB_Create_Proc_List(ZZ *, int, int, int, int *, MPI_Comm, int, int);

#ifdef __cplusplus
} /* closing bracket for extern "C" */
#endif

#endif