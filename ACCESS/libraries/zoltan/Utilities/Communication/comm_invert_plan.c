/*****************************************************************************
 * Zoltan Library for Parallel Applications                                  *
 * Copyright (c) 2000,2001,2002, Sandia National Laboratories.               *
 * This software is distributed under the GNU Lesser General Public License. *
 * For more info, see the README file in the top-level Zoltan directory.     *
 *****************************************************************************/
/*****************************************************************************
 * CVS File Information :
 *    $RCSfile: comm_invert_plan.c,v $
 *    $Author: gdsjaar $
 *    $Date: 2009/06/09 18:37:55 $
 *    Revision: 1.2 $
 ****************************************************************************/

#include <stdio.h>
#include "comm.h"
#include "zoltan_mem.h"

#ifdef __cplusplus
/* if C++, define the rest of this header file as extern C */
extern "C" {
#endif


/* 
 * Given a communication plan, invert the plan for the reverse communication.
 * The sizes in the inverted plan are assumed to be uniform.
 * The input plan is overwritten with the inverted plan.
 * If an error occurs, the old plan is returned unchanged.
 * Note:  receives in new plan are blocked, even if sends in old 
 * plan were not.   This blocking allows variable sized sends to be
 * done with the new plan (Zoltan_Comm_Resize).  However, it also means
 * the new plan can not do exactly what Zoltan_Comm_Do_Reverse can do.
 * If the application cares about the order of received data, it should
 * not use this routine.
 */

int Zoltan_Comm_Invert_Plan(
ZOLTAN_COMM_OBJ **plan 		/* communicator object to be inverted */
)
{
static char *yo = "Zoltan_Comm_Invert_Plan";
ZOLTAN_COMM_OBJ *old = *plan, *new = NULL;
int i, ierr = ZOLTAN_OK;
int total_send_length;
int max_recv_length;

  if (old == NULL){
    ZOLTAN_COMM_ERROR("NULL input plan.", yo, -1);
    ierr = ZOLTAN_FATAL;
    goto End;
  }

  total_send_length = 0;
  for (i = 0; i < old->nsends + old->self_msg; i++) {
    total_send_length += old->lengths_to[i];
  }

  max_recv_length = 0;
  for (i = 0; i < old->nrecvs; i++) {
    if (old->lengths_from[i] > max_recv_length)
      max_recv_length = old->lengths_from[i];
  }

  new = (ZOLTAN_COMM_OBJ *) ZOLTAN_MALLOC(sizeof(ZOLTAN_COMM_OBJ));
  if (!new) {
    ierr = ZOLTAN_MEMERR;
    goto End;
  }
  new->lengths_to = old->lengths_from;
  new->starts_to = old->starts_from;
  new->procs_to = old->procs_from;
  new->indices_to = old->indices_from;
  new->lengths_from = old->lengths_to;
  new->starts_from = old->starts_to;
  new->procs_from = old->procs_to;
  new->indices_from = NULL;    /* In new plan, receives are blocked. */

  /* Assumption:  uniform object sizes in output plans.   */
  /* Can be changed by later calls to Zoltan_Comm_Resize. */
  new->sizes = NULL;
  new->sizes_to = NULL;
  new->sizes_from = NULL;
  new->starts_to_ptr = NULL;
  new->starts_from_ptr = NULL;
  new->indices_to_ptr = NULL;
  new->indices_from_ptr = NULL;

  new->nvals = old->nvals_recv;
  new->nvals_recv = old->nvals;
  new->nrecvs = old->nsends;
  new->nsends = old->nrecvs;
  new->self_msg = old->self_msg;
  new->max_send_size = max_recv_length;
  new->total_recv_size = total_send_length;
  new->comm = old->comm;

  new->request = (MPI_Request *) ZOLTAN_MALLOC(new->nrecvs*sizeof(MPI_Request));
  new->status = (MPI_Status *) ZOLTAN_MALLOC(new->nrecvs*sizeof(MPI_Status));

  if (new->nrecvs && ((new->request == NULL) || (new->status == NULL))) {
    ierr = ZOLTAN_MEMERR;
    goto End;
  }

End:
  if (ierr == ZOLTAN_OK) {
    if (old->indices_to)       ZOLTAN_FREE(&(old->indices_to));
    if (old->sizes)            ZOLTAN_FREE(&(old->sizes));
    if (old->sizes_to)         ZOLTAN_FREE(&(old->sizes_to));
    if (old->sizes_from)       ZOLTAN_FREE(&(old->sizes_from));
    if (old->starts_to_ptr)    ZOLTAN_FREE(&(old->starts_to_ptr));
    if (old->starts_from_ptr)  ZOLTAN_FREE(&(old->starts_from_ptr));
    if (old->indices_to_ptr)   ZOLTAN_FREE(&(old->indices_to_ptr));
    if (old->indices_from_ptr) ZOLTAN_FREE(&(old->indices_from_ptr));
    if (old->request)          ZOLTAN_FREE(&(old->request));
    if (old->status)           ZOLTAN_FREE(&(old->status));
    ZOLTAN_FREE(&old);
    *plan = new;
  }
  else {
    if (new) {
      ZOLTAN_FREE(&(new->request));
      ZOLTAN_FREE(&(new->status));
      ZOLTAN_FREE(&new);
    }
  }
  return (ierr);
}

#ifdef __cplusplus
} /* closing bracket for extern "C" */
#endif