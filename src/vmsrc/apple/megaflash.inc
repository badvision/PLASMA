;//
;// MegaFlash Hardware Constants
;// For Apple IIc/IIc+ with MegaFlash storage device
;//
;//
;// MegaFlash I/O Registers (Slot 4)
;//
!cpu 65c02 ; If you're using a megaflash, you have a 65c02 processor
MF_SLOT       = 4
MF_CMDREG     = $C0C0     // Command register (slot 4)
MF_PARAMREG   = $C0C1     // Parameter register (read/write)
MF_STATUSREG  = $C0C0     // Status register (same as command)
MF_IDREG      = $C0C3     // ID register

//
// MegaFlash FPU Commands
//
MF_CMD_FADD   = $30       // Floating point add
MF_CMD_FMUL   = $31       // Floating point multiply
MF_CMD_FDIV   = $32       // Floating point divide
MF_CMD_FSIN   = $33       // Floating point sine
MF_CMD_FCOS   = $34       // Floating point cosine
MF_CMD_FTAN   = $35       // Floating point tangent
MF_CMD_FATN   = $36       // Floating point arctangent
MF_CMD_FLOG   = $37       // Floating point natural log
MF_CMD_FEXP   = $38       // Floating point exponential
MF_CMD_FSQR   = $39       // Floating point square root
MF_CMD_FOUT   = $3A       // Format floating point as string

//
// MegaFlash Error Codes (in parameter buffer)
//
MF_ERR_NONE       = $00   // No error
MF_ERR_TIMEOUT    = $01   // Operation timeout (software)
MF_ERR_BADPARAM   = $03   // Invalid parameter / bad data format
MF_ERR_ILLEGAL    = $20   // Illegal quantity
MF_ERR_DIV0       = $40   // Division by zero
MF_ERR_OVERFLOW   = $80   // Overflow error

//
// Status Register Bits
//
MF_STATUS_BUSY    = $80   // Busy flag (bit 7)

//
// MBF (Microsoft Binary Format) constants
//
MBF_SIZE          = 7     // FAC/ARG size: exp + 4 mantissa bytes + sign + extension
MBF_EXT_SIZE      = 1     // Extension byte size (now part of MBF_SIZE)
MBF_TOTAL         = 14    // Total buffer size for FAC (7 bytes) + ARG (7 bytes)

//
// SANE Extended Format constants (for conversion)
//
t_extended        = 10    // 80-bit extended precision size
