C Copyright(C) 2009 Sandia Corporation. Under the terms of Contract
C DE-AC04-94AL85000 with Sandia Corporation, the U.S. Government retains
C certain rights in this software.
C         
C Redistribution and use in source and binary forms, with or without
C modification, are permitted provided that the following conditions are
C met:
C 
C     * Redistributions of source code must retain the above copyright
C       notice, this list of conditions and the following disclaimer.
C 
C     * Redistributions in binary form must reproduce the above
C       copyright notice, this list of conditions and the following
C       disclaimer in the documentation and/or other materials provided
C       with the distribution.
C     * Neither the name of Sandia Corporation nor the names of its
C       contributors may be used to endorse or promote products derived
C       from this software without specific prior written permission.
C 
C THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
C "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
C LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
C A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
C OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
C SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
C LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
C DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
C THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
C (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
C OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

C=======================================================================
      SUBROUTINE DBIST1 (NDB, NVARNP, NVARDM, NUMNP, VARNP, IVAR, *)
C=======================================================================
C$Id: dbist1.f,v 1.2 2009/03/25 04:47:54 gdsjaar Exp $
C$Log: dbist1.f,v $
CRevision 1.2  2009/03/25 04:47:54  gdsjaar
CAdded blotII2 source since Copyright was asserted.
C
CUpdate copyright notice in suplib.
C
CAdd blotII2 to config files.  Note that blot will not build yet since
Cit requires some libraries that are still being reviewed for copyright
Cassertion.
C
CRevision 1.2  1992/04/08 21:13:21  gdsjaar
CFixed problem with singly accessing doubly dimensioned array
CAdded params to dbist2 and dbist1 so error messages would print
C
c Revision 1.1.1.1  1990/08/14  16:12:59  gdsjaar
c Testing
c
c Revision 1.1  90/08/14  16:12:58  gdsjaar
c Initial revision
c 
c Revision 1.1  90/08/09  13:39:12  gdsjaar
c Initial revision
c 

C   --*** DBIST1 *** (EXOLIB) Internal to DBISTE, Read nodal variables 
C   --   Written by Greg Sjaardema 8/8/90, to remove MAX from dimensions
C   --
C   --DBIST1 reads the database nodal variables for one time step.
C   --
C   --Parameters:
C   --   NDB - IN - the database number
C   --   NVARNP - IN - the number of nodal variables
C   --   NVARDM - IN - the row dimension of VARNP
C   --   NUMNP - IN - the number of nodes
C   --   VARNP - OUT - the nodal variables for the time step (if OPTION)
C   --   IVAR  - OUT - the nodal variable number if error on read.
C   --   * - return statement if error encountered, including end-of-file;
C   --      message is printed
C   --
      INTEGER NDB
      INTEGER NVARNP, NVARDM, NUMNP
      REAL VARNP(NVARDM,*)

      DO 100 IVAR = 1, NVARNP
         READ (NDB, END=190, ERR=190, IOSTAT=IERR)
     &        (VARNP(IVAR,INP), INP=1,NUMNP)
  100 CONTINUE
      RETURN
  190 CONTINUE
      RETURN 1
      END