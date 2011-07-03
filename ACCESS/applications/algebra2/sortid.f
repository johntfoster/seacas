C    Copyright(C) 2008 Sandia Corporation.  Under the terms of Contract
C    DE-AC04-94AL85000 with Sandia Corporation, the U.S. Government retains
C    certain rights in this software
C    
C    Redistribution and use in source and binary forms, with or without
C    modification, are permitted provided that the following conditions are
C    met:
C    
C    * Redistributions of source code must retain the above copyright
C       notice, this list of conditions and the following disclaimer.
C              
C    * Redistributions in binary form must reproduce the above
C      copyright notice, this list of conditions and the following
C      disclaimer in the documentation and/or other materials provided
C      with the distribution.
C                            
C    * Neither the name of Sandia Corporation nor the names of its
C      contributors may be used to endorse or promote products derived
C      from this software without specific prior written permission.
C                                                    
C    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
C    "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
C    LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
C    A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
C    OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
C    SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
C    LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
C    DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
C    THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
C    (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
C    OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
C    

C=======================================================================
      SUBROUTINE SORTID (STYP, ITOTAL, IBEGIN, IEND)
C=======================================================================
C $Id: sortid.f,v 1.1 2008/10/31 05:04:01 gdsjaar Exp $
C $Log: sortid.f,v $
C Revision 1.1  2008/10/31 05:04:01  gdsjaar
C Moved the applications into an applications subdirectory.
C
C Revision 1.1  2008/06/18 16:00:27  gdsjaar
C Initial adding of files to sourceforge
C
C Revision 1.4  2008/03/14 13:45:29  gdsjaar
C Added copyright information to top of all files.
C
C ALGEBRA2 is now open-sourced under BSD license
C
C Revision 1.3  1995/10/03 21:36:44  mksmith
C Removing old algII files
C Replacing modified algII files
C
C Revision 1.2  1993/08/02 14:21:41  gdsjaar
C Split out common blocks into separare files. Miscellaneous bug fixes
C on several files.  First public release version.
C
c Revision 1.1  1993/07/30  21:44:02  gdsjaar
c Initial checkin of ACCESS/translate/algII
c
c Revision 1.1.1.1  1990/11/09  16:26:06  gdsjaar
c Algebra - Unix Version
c
c Revision 1.1  90/11/09  16:26:05  gdsjaar
c Initial revision
c 

C   --*** SORTID *** (ALGEBRA) Gather equation variables of one type
C   --   Written by Amy Gilkey - revised 08/19/87
C   --
C   --SORTID gathers the variables of the specified type into one area
C   --of the /VAR../ arrays and orders these variables by IDVAR.
C   --The variables are sorted at the start of the specified range.
C   --
C   --Parameters:
C   --   STYP   - IN - the variable type to be sorted
C   --   ITOTAL - IN - the ending /VAR../ index of the variables to be ordered
C   --   IBEGIN - IN - the starting /VAR../ index of the variables of type STYP
C   --   IEND   - OUT - the ending /VAR../ index of the variables of type STYP
C   --
C   --Common Variables:
C   --   Sets NAMVAR, TYPVAR, IDVAR, ISTVAR, IEVVAR of /VAR../

      include 'params.blk'
      include 'var.blk'

      CHARACTER STYP

      CHARACTER*(MXSTLN) NAMTMP
      CHARACTER TYPTMP
      INTEGER ISTTMP(3)

      IEND = IBEGIN - 1

      DO 110 NVAR = IBEGIN, ITOTAL

         NID = 0
         DO 100 I = NVAR, ITOTAL
            IF (TYPVAR(I) .EQ. STYP) THEN
               IF (NID .EQ. 0) NID = I
               IF (IDVAR(I) .LT. IDVAR(NID)) NID = I
            END IF
  100    CONTINUE
         IF (NID .EQ. 0) GOTO 120

         IEND = IEND + 1

         IF (NID .NE. NVAR) THEN
            NAMTMP = NAMVAR(NVAR)
            TYPTMP = TYPVAR(NVAR)
            IDTMP = IDVAR(NVAR)
            ISTTMP(1) = ISTVAR(1,NVAR)
            ISTTMP(2) = ISTVAR(2,NVAR)
            ISTTMP(3) = ISTVAR(3,NVAR)
            IEVTMP = IEVVAR(NVAR)

            NAMVAR(NVAR) = NAMVAR(NID)
            TYPVAR(NVAR) = TYPVAR(NID)
            IDVAR(NVAR) = IDVAR(NID)
            ISTVAR(1,NVAR) = ISTVAR(1,NID)
            ISTVAR(2,NVAR) = ISTVAR(2,NID)
            ISTVAR(3,NVAR) = ISTVAR(3,NID)
            IEVVAR(NVAR) = IEVVAR(NID)

            NAMVAR(NID) = NAMTMP
            TYPVAR(NID) = TYPTMP
            IDVAR(NID) = IDTMP
            ISTVAR(1,NID) = ISTTMP(1)
            ISTVAR(2,NID) = ISTTMP(2)
            ISTVAR(3,NID) = ISTTMP(3)
            IEVVAR(NID) = IEVTMP
         END IF
  110 CONTINUE

  120 CONTINUE
      RETURN
      END
