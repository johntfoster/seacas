C Copyright(C) 2011 Sandia Corporation.  Under the terms of Contract
C DE-AC04-94AL85000 with Sandia Corporation, the U.S. Government retains
C certain rights in this software
C 
C Redistribution and use in source and binary forms, with or without
C modification, are permitted provided that the following conditions are
C met:
C 
C * Redistributions of source code must retain the above copyright
C    notice, this list of conditions and the following disclaimer.
C           
C * Redistributions in binary form must reproduce the above
C   copyright notice, this list of conditions and the following
C   disclaimer in the documentation and/or other materials provided
C   with the distribution.
C                         
C * Neither the name of Sandia Corporation nor the names of its
C   contributors may be used to endorse or promote products derived
C   from this software without specific prior written permission.
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
C 

C     -*- Mode: fortran -*-
C=======================================================================
      SUBROUTINE SPTXYZ (XN, YN, XN3, YN3, ZN3, ATRIB,
     &     NSPL, ZS, XS, XS2, YS, YS2, SCR )
C=======================================================================

C   $Id: sptxyz.f,v 1.2 1991/01/09 12:59:42 gdsjaar Exp $
C   $Log: sptxyz.f,v $
C   Revision 1.2  1991/01/09 12:59:42  gdsjaar
C   Initial conversion from GEN3D to GENSHELL, no BC yet
C
c Revision 1.1.1.1  90/08/20  12:23:09  gdsjaar
c Gen3D Mesh Generation Program
c 
c Revision 1.1  90/08/20  12:23:07  gdsjaar
c Initial revision
c 
      
C     --*** SPLTYZ *** (GEN3D) Calculate 3D coordinates for Spline translation
C     --   Written by Greg Sjaardema - 02/06/89
C     --
C     --Parameters:
C     --   XN, YN - IN - the 2D coordinates, destroyed
C     --   XN3, YN3, ZN3 - OUT - the 3D coordinates
C     --   IXNP - IN - the new index for each node
C     --   NRNP - IN - the number of new nodes generated for each node
C     --   ZCORD - SCRATCH - size = NNREPL, holds z coordinate for transformations
C     --   NSPL - IN - number of spline points
C     --   ZS, XS, YS - IN - spline data points
C     --   XS2, YS2 - SCRATCH - temporary storage for spline data
C     --   SCR - SCRATCH - temporary storage for spoine data
C     --
C     --Common Variables:
C     --   Uses NDIM, NUMNP of /DBNUMS/
C     --   Uses NDIM3, NUMNP3 of /DBNUM3/
C     --   Uses DOTRAN, NNREPL, DIM3, NRTRAN, D3TRAN, ZGRAD,
C     --      CENTER, NUMCOL, NUMROW of /PARAMS/
      
      INCLUDE 'dbnums.blk'
      INCLUDE 'dbnum3.blk'
      INCLUDE 'params.blk'
      
      PARAMETER (BINGO = 1.0E38)
      PARAMETER (TOLER = 1.0E-8)
      
      REAL XN(NUMNP), YN(NUMNP),
     &     XN3(NUMNP3), YN3(NUMNP3), ZN3(NUMNP3)
      REAL ATRIB(NUMEL)
      REAL ZS(NSPL), XS(NSPL), XS2(NSPL), YS(NSPL), YS2(NSPL)
      REAL SCR(NSPL), SLLFT(2), SLRGT(2)
      
C     ... CALCULATE THE THICKNESS INCREMENT FOR EACH TRANSLATION
      
      IBLK = 0
      ZTOT = 0.0
   10 CONTINUE
      IBLK = IBLK + 1
      IF (NRTRAN(IBLK) .GT. 0) THEN
         ZTOT = ZTOT + D3TRAN(IBLK)
         IF (IBLK .LT. 10) GO TO 10
      END IF
      
      NXTNR = 1
      IBLK = 0
      ZEND = 0.0
      
   20 CONTINUE
      IBLK = IBLK + 1
      IF (NRTRAN(IBLK) .GT. 0) THEN
         ZBEG = ZEND
         ZEND = ZBEG + D3TRAN(IBLK)
         CALL INIGRD (ZBEG/ZTOT, ZEND/ZTOT, ZGRAD(IBLK),
     *        NRTRAN(IBLK), NRTRAN(IBLK)+1, ZCORD(NXTNR) )
         NXTNR = NXTNR + NRTRAN(IBLK)
         IF (IBLK .LT. 10) GO TO 20
      END IF
      
      CALL SPLINE (ZS, XS, NSPL, SLLFT(1), SLRGT(1), XS2, SCR)
      CALL SPLINE (ZS, YS, NSPL, SLLFT(2), SLRGT(2), YS2, SCR)
      
      ZMAX = ZS(NSPL)
      
      KLO = 1
      
C     ... This is inside-out, reverse sometime for efficiency.
      
c$$$  DO 80 INP = 1, NUMNP
c$$$  JNP = IXNP(INP) - 1
c$$$  DO 70 NR = 1, NNREPL
c$$$  Z = ZCORD(NR) * ZMAX
c$$$  CALL HUNT (ZS, NSPL, Z, KLO)
c$$$  IF (KLO .EQ. NSPL) KLO = KLO - 1
c$$$  IF (KLO .EQ.    0) KLO = KLO + 1
c$$$  
c$$$  H  = ZS(KLO+1) - ZS(KLO)
c$$$  A  = (ZS(KLO+1)-Z)/H
c$$$  B  = (Z-ZS(KLO))/H
c$$$  
c$$$  XOFF = A * XS(KLO) + B * XS(KLO+1) +
c$$$  *         ((A**3-A) * XS2(KLO)+(B**3-B)*XS2(KLO+1)) * (H**2) / 6.
c$$$  
c$$$  YOFF = A * YS(KLO) + B * YS(KLO+1) +
c$$$  *         ((A**3-A) * YS2(KLO)+(B**3-B)*YS2(KLO+1)) * (H**2) / 6.
c$$$  
c$$$  XN3(JNP+NR) = XN(INP) + XOFF
c$$$  YN3(JNP+NR) = YN(INP) + YOFF
c$$$  ZN3(JNP+NR) = Z
c$$$  70    CONTINUE
c$$$  80 CONTINUE
      
      DO 80 NR = 1, NNREPL
         Z = ZCORD(NR) * ZMAX
         CALL HUNT (ZS, NSPL, Z, KLO)
         KLO = MIN(NSPL-1, MAX(1, KLO))
 
         H  = ZS(KLO+1) - ZS(KLO)
         A  = (ZS(KLO+1)-Z)/H
         B  = (Z-ZS(KLO))/H
         
         XOFF = A * XS(KLO) + B * XS(KLO+1) +
     *        ((A**3-A) * XS2(KLO)+(B**3-B)*XS2(KLO+1)) * (H**2) / 6.
         
         YOFF = A * YS(KLO) + B * YS(KLO+1) +
     *        ((A**3-A) * YS2(KLO)+(B**3-B)*YS2(KLO+1)) * (H**2) / 6.
         
         DO 70 INP = 1, NUMNP
            JNP = IXNP(INP) - 1
            XN3(JNP+NR) = XN(INP) + XOFF
            YN3(JNP+NR) = YN(INP) + YOFF
            ZN3(JNP+NR) = Z
   70    CONTINUE
   80 CONTINUE
      
      RETURN
      END
