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
      SUBROUTINE DBOXYZ (NDB, NDIM, NUMNP, XN, YN, ZN)
C=======================================================================
C$Id: dboxyz.f,v 1.2 2009/03/25 04:47:54 gdsjaar Exp $
C$Log: dboxyz.f,v $
CRevision 1.2  2009/03/25 04:47:54  gdsjaar
CAdded blotII2 source since Copyright was asserted.
C
CUpdate copyright notice in suplib.
C
CAdd blotII2 to config files.  Note that blot will not build yet since
Cit requires some libraries that are still being reviewed for copyright
Cassertion.
C
CRevision 1.1.1.1  1990/08/14 16:13:43  gdsjaar
CTesting
C
c Revision 1.1  90/08/14  16:13:42  gdsjaar
c Initial revision
c 
c Revision 1.1  90/08/09  13:39:18  gdsjaar
c Initial revision
c 

C   --*** DBOXYZ *** (EXOLIB) Write database coordinates
C   --   Written by Amy Gilkey - revised 02/27/86
C   --
C   --DBOXYZ writes the coordinate array to the database.
C   --
C   --Parameters:
C   --   NDB - IN - the database file
C   --   NDIM - IN - the number of coordinates per node
C   --   NUMNP - IN - the number of nodes
C   --   XN, YN, ZN - IN - the coordinates
C   --
C   --Database must be positioned at start of coordinates upon entry;
C   --upon exit at end of coordinates.

      INTEGER NDB
      INTEGER NDIM, NUMNP
      REAL XN(*), YN(*), ZN(*)

      IF ((NUMNP .GT. 0) .AND. (NDIM .GT. 0)) THEN
         IF (NDIM .EQ. 2) THEN
            WRITE (NDB) (XN(INP), INP=1,NUMNP), (YN(INP), INP=1,NUMNP)
         ELSE IF (NDIM .GE. 3) THEN
            WRITE (NDB) (XN(INP), INP=1,NUMNP), (YN(INP), INP=1,NUMNP),
     &         (ZN(INP), INP=1,NUMNP)
         ELSE
            WRITE (NDB) 0
         END IF
      ELSE
         WRITE (NDB) 0
      END IF

      RETURN
      END