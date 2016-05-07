local functions = [[
//*************************************************************************
//*************************************************************************
//*********  Functions declarations as declared in original arm_neon.h *****
//*************************************************************************
//Vector add: vadd -> Vr[i]:=Va[i]+Vb[i], Vr, Va, Vb have equal lane sizes.
int8x8_t vadd_s8(int8x8_t a, int8x8_t b); // VADD.I8 d0,d0,d0
int16x4_t vadd_s16(int16x4_t a, int16x4_t b); // VADD.I16 d0,d0,d0
int32x2_t vadd_s32(int32x2_t a, int32x2_t b); // VADD.I32 d0,d0,d0
int64x1_t vadd_s64(int64x1_t a, int64x1_t b); // VADD.I64 d0,d0,d0
float32x2_t vadd_f32(float32x2_t a, float32x2_t b); // VADD.F32 d0,d0,d0
uint8x8_t vadd_u8(uint8x8_t a, uint8x8_t b); // VADD.I8 d0,d0,d0
uint16x4_t vadd_u16(uint16x4_t a, uint16x4_t b); // VADD.I16 d0,d0,d0
uint32x2_t vadd_u32(uint32x2_t a, uint32x2_t b); // VADD.I32 d0,d0,d0
uint64x1_t vadd_u64(uint64x1_t a, uint64x1_t b); // VADD.I64 d0,d0,d0
int8x16_t vaddq_s8(int8x16_t a, int8x16_t b); // VADD.I8 q0,q0,q0
int16x8_t vaddq_s16(int16x8_t a, int16x8_t b); // VADD.I16 q0,q0,q0
int32x4_t vaddq_s32(int32x4_t a, int32x4_t b); // VADD.I32 q0,q0,q0
int64x2_t vaddq_s64(int64x2_t a, int64x2_t b); // VADD.I64 q0,q0,q0
float32x4_t vaddq_f32(float32x4_t a, float32x4_t b); // VADD.F32 q0,q0,q0
uint8x16_t vaddq_u8(uint8x16_t a, uint8x16_t b); // VADD.I8 q0,q0,q0
uint16x8_t vaddq_u16(uint16x8_t a, uint16x8_t b); // VADD.I16 q0,q0,q0
uint32x4_t vaddq_u32(uint32x4_t a, uint32x4_t b); // VADD.I32 q0,q0,q0
uint64x2_t vaddq_u64(uint64x2_t a, uint64x2_t b); // VADD.I64 q0,q0,q0
//Vector long add: vaddl -> Vr[i]:=Va[i]+Vb[i], Va, Vb have equal lane sizes, result is a 128 bit vector of lanes that are twice the width.
int16x8_t vaddl_s8(int8x8_t a, int8x8_t b); // VADDL.S8 q0,d0,d0
int32x4_t vaddl_s16(int16x4_t a, int16x4_t b); // VADDL.S16 q0,d0,d0
int64x2_t vaddl_s32(int32x2_t a, int32x2_t b); // VADDL.S32 q0,d0,d0
uint16x8_t vaddl_u8(uint8x8_t a, uint8x8_t b); // VADDL.U8 q0,d0,d0
uint32x4_t vaddl_u16(uint16x4_t a, uint16x4_t b); // VADDL.U16 q0,d0,d0
uint64x2_t vaddl_u32(uint32x2_t a, uint32x2_t b); // VADDL.U32 q0,d0,d0
//Vector wide addw: vadd -> Vr[i]:=Va[i]+Vb[i]
int16x8_t vaddw_s8(int16x8_t a, int8x8_t b); // VADDW.S8 q0,q0,d0
int32x4_t vaddw_s16(int32x4_t a, int16x4_t b); // VADDW.S16 q0,q0,d0
int64x2_t vaddw_s32(int64x2_t a, int32x2_t b); // VADDW.S32 q0,q0,d0
uint16x8_t vaddw_u8(uint16x8_t a, uint8x8_t b); // VADDW.U8 q0,q0,d0
uint32x4_t vaddw_u16(uint32x4_t a, uint16x4_t b); // VADDW.U16 q0,q0,d0
uint64x2_t vaddw_u32(uint64x2_t a, uint32x2_t b); // VADDW.U32 q0,q0,d0
//Vector halving add: vhadd -> Vr[i]:=(Va[i]+Vb[i])>>1
int8x8_t vhadd_s8(int8x8_t a, int8x8_t b); // VHADD.S8 d0,d0,d0
int16x4_t vhadd_s16(int16x4_t a, int16x4_t b); // VHADD.S16 d0,d0,d0
int32x2_t vhadd_s32(int32x2_t a, int32x2_t b); // VHADD.S32 d0,d0,d0
uint8x8_t vhadd_u8(uint8x8_t a, uint8x8_t b); // VHADD.U8 d0,d0,d0
uint16x4_t vhadd_u16(uint16x4_t a, uint16x4_t b); // VHADD.U16 d0,d0,d0
uint32x2_t vhadd_u32(uint32x2_t a, uint32x2_t b); // VHADD.U32 d0,d0,d0
int8x16_t vhaddq_s8(int8x16_t a, int8x16_t b); // VHADD.S8 q0,q0,q0
int16x8_t vhaddq_s16(int16x8_t a, int16x8_t b); // VHADD.S16 q0,q0,q0
int32x4_t vhaddq_s32(int32x4_t a, int32x4_t b); // VHADD.S32 q0,q0,q0
uint8x16_t vhaddq_u8(uint8x16_t a, uint8x16_t b); // VHADD.U8 q0,q0,q0
uint16x8_t vhaddq_u16(uint16x8_t a, uint16x8_t b); // VHADD.U16 q0,q0,q0
uint32x4_t vhaddq_u32(uint32x4_t a, uint32x4_t b); // VHADD.U32 q0,q0,q0
//Vector rounding halving add: vrhadd -> Vr[i]:=(Va[i]+Vb[i]+1)>>1
int8x8_t vrhadd_s8(int8x8_t a, int8x8_t b); // VRHADD.S8 d0,d0,d0
int16x4_t vrhadd_s16(int16x4_t a, int16x4_t b); // VRHADD.S16 d0,d0,d0
int32x2_t vrhadd_s32(int32x2_t a, int32x2_t b); // VRHADD.S32 d0,d0,d0
uint8x8_t vrhadd_u8(uint8x8_t a, uint8x8_t b); // VRHADD.U8 d0,d0,d0
uint16x4_t vrhadd_u16(uint16x4_t a, uint16x4_t b); // VRHADD.U16 d0,d0,d0
uint32x2_t vrhadd_u32(uint32x2_t a, uint32x2_t b); // VRHADD.U32 d0,d0,d0
int8x16_t vrhaddq_s8(int8x16_t a, int8x16_t b); // VRHADD.S8 q0,q0,q0
int16x8_t vrhaddq_s16(int16x8_t a, int16x8_t b); // VRHADD.S16 q0,q0,q0
int32x4_t vrhaddq_s32(int32x4_t a, int32x4_t b); // VRHADD.S32 q0,q0,q0
uint8x16_t vrhaddq_u8(uint8x16_t a, uint8x16_t b); // VRHADD.U8 q0,q0,q0
uint16x8_t vrhaddq_u16(uint16x8_t a, uint16x8_t b); // VRHADD.U16 q0,q0,q0
uint32x4_t vrhaddq_u32(uint32x4_t a, uint32x4_t b); // VRHADD.U32 q0,q0,q0
//Vector saturating add: vqadd -> Vr[i]:=sat<size>(Va[i]+Vb[i])
int8x8_t vqadd_s8(int8x8_t a, int8x8_t b); // VQADD.S8 d0,d0,d0
int16x4_t vqadd_s16(int16x4_t a, int16x4_t b); // VQADD.S16 d0,d0,d0
int32x2_t vqadd_s32(int32x2_t a, int32x2_t b); // VQADD.S32 d0,d0,d0
int64x1_t vqadd_s64(int64x1_t a, int64x1_t b); // VQADD.S64 d0,d0,d0
uint8x8_t vqadd_u8(uint8x8_t a, uint8x8_t b); // VQADD.U8 d0,d0,d0
uint16x4_t vqadd_u16(uint16x4_t a, uint16x4_t b); // VQADD.U16 d0,d0,d0
uint32x2_t vqadd_u32(uint32x2_t a, uint32x2_t b); // VQADD.U32 d0,d0,d0
uint64x1_t vqadd_u64(uint64x1_t a, uint64x1_t b); // VQADD.U64 d0,d0,d0
int8x16_t vqaddq_s8(int8x16_t a, int8x16_t b); // VQADD.S8 q0,q0,q0
int16x8_t vqaddq_s16(int16x8_t a, int16x8_t b); // VQADD.S16 q0,q0,q0
int32x4_t vqaddq_s32(int32x4_t a, int32x4_t b); // VQADD.S32 q0,q0,q0
int64x2_t vqaddq_s64(int64x2_t a, int64x2_t b); // VQADD.S64 q0,q0,q0
uint8x16_t vqaddq_u8(uint8x16_t a, uint8x16_t b); // VQADD.U8 q0,q0,q0
uint16x8_t vqaddq_u16(uint16x8_t a, uint16x8_t b); // VQADD.U16 q0,q0,q0
uint32x4_t vqaddq_u32(uint32x4_t a, uint32x4_t b); // VQADD.U32 q0,q0,q0
uint64x2_t vqaddq_u64(uint64x2_t a, uint64x2_t b); // VQADD.U64 q0,q0,q0
//Vector add high half: vaddhn-> Vr[i]:=Va[i]+Vb[i]
int8x8_t vaddhn_s16(int16x8_t a, int16x8_t b); // VADDHN.I16 d0,q0,q0
int16x4_t vaddhn_s32(int32x4_t a, int32x4_t b); // VADDHN.I32 d0,q0,q0
int32x2_t vaddhn_s64(int64x2_t a, int64x2_t b); // VADDHN.I64 d0,q0,q0
uint8x8_t vaddhn_u16(uint16x8_t a, uint16x8_t b); // VADDHN.I16 d0,q0,q0
uint16x4_t vaddhn_u32(uint32x4_t a, uint32x4_t b); // VADDHN.I32 d0,q0,q0
uint32x2_t vaddhn_u64(uint64x2_t a, uint64x2_t b); // VADDHN.I64 d0,q0,q0
//Vector rounding add high half: vraddhn
int8x8_t vraddhn_s16(int16x8_t a, int16x8_t b); // VRADDHN.I16 d0,q0,q0
int16x4_t vraddhn_s32(int32x4_t a, int32x4_t b); // VRADDHN.I32 d0,q0,q0
int32x2_t vraddhn_s64(int64x2_t a, int64x2_t b); // VRADDHN.I64 d0,q0,q0
uint8x8_t vraddhn_u16(uint16x8_t a, uint16x8_t b); // VRADDHN.I16 d0,q0,q0
uint16x4_t vraddhn_u32(uint32x4_t a, uint32x4_t b); // VRADDHN.I32 d0,q0,q0
uint32x2_t vraddhn_u64(uint64x2_t a, uint64x2_t b); // VRADDHN.I64 d0,q0,q0
//Multiplication
//Vector multiply: vmul -> Vr[i] := Va[i] * Vb[i]
int8x8_t vmul_s8(int8x8_t a, int8x8_t b); // VMUL.I8 d0,d0,d0
int16x4_t vmul_s16(int16x4_t a, int16x4_t b); // VMUL.I16 d0,d0,d0
int32x2_t vmul_s32(int32x2_t a, int32x2_t b); // VMUL.I32 d0,d0,d0
float32x2_t vmul_f32(float32x2_t a, float32x2_t b); // VMUL.F32 d0,d0,d0
uint8x8_t vmul_u8(uint8x8_t a, uint8x8_t b); // VMUL.I8 d0,d0,d0
uint16x4_t vmul_u16(uint16x4_t a, uint16x4_t b); // VMUL.I16 d0,d0,d0
uint32x2_t vmul_u32(uint32x2_t a, uint32x2_t b); // VMUL.I32 d0,d0,d0
poly8x8_t vmul_p8(poly8x8_t a, poly8x8_t b); // VMUL.P8 d0,d0,d0
int8x16_t vmulq_s8(int8x16_t a, int8x16_t b); // VMUL.I8 q0,q0,q0
int16x8_t vmulq_s16(int16x8_t a, int16x8_t b); // VMUL.I16 q0,q0,q0
int32x4_t vmulq_s32(int32x4_t a, int32x4_t b); // VMUL.I32 q0,q0,q0
float32x4_t vmulq_f32(float32x4_t a, float32x4_t b); // VMUL.F32 q0,q0,q0
uint8x16_t vmulq_u8(uint8x16_t a, uint8x16_t b); // VMUL.I8 q0,q0,q0
uint16x8_t vmulq_u16(uint16x8_t a, uint16x8_t b); // VMUL.I16 q0,q0,q0
uint32x4_t vmulq_u32(uint32x4_t a, uint32x4_t b); // VMUL.I32 q0,q0,q0
poly8x16_t vmulq_p8(poly8x16_t a, poly8x16_t b); // VMUL.P8 q0,q0,q0
//multiply lane
int16x4_t vmul_lane_s16 (int16x4_t a, int16x4_t b, __constrange(0,3) int c);
int32x2_t vmul_lane_s32 (int32x2_t a, int32x2_t b, __constrange(0,1) int c);
float32x2_t vmul_lane_f32 (float32x2_t a, float32x2_t b, __constrange(0,1) int c);
uint16x4_t vmul_lane_u16 (uint16x4_t a, uint16x4_t b, __constrange(0,3) int c);
uint32x2_t vmul_lane_u32 (uint32x2_t a, uint32x2_t b, __constrange(0,1) int c);
int16x8_t vmulq_lane_s16 (int16x8_t a, int16x4_t b, __constrange(0,3) int c);
int32x4_t vmulq_lane_s32 (int32x4_t a, int32x2_t b, __constrange(0,1) int c);
float32x4_t vmulq_lane_f32 (float32x4_t a, float32x2_t b, __constrange(0,1) int c);
uint16x8_t vmulq_lane_u16 (uint16x8_t a, uint16x4_t b, __constrange(0,3) int c);
uint32x4_t vmulq_lane_u32 (uint32x4_t a, uint32x2_t b, __constrange(0,1) int c);
//Vector multiply accumulate: vmla -> Vr[i] := Va[i] + Vb[i] * Vc[i]
int8x8_t vmla_s8(int8x8_t a, int8x8_t b, int8x8_t c); // VMLA.I8 d0,d0,d0
int16x4_t vmla_s16(int16x4_t a, int16x4_t b, int16x4_t c); // VMLA.I16 d0,d0,d0
int32x2_t vmla_s32(int32x2_t a, int32x2_t b, int32x2_t c); // VMLA.I32 d0,d0,d0
float32x2_t vmla_f32(float32x2_t a, float32x2_t b, float32x2_t c); // VMLA.F32 d0,d0,d0
uint8x8_t vmla_u8(uint8x8_t a, uint8x8_t b, uint8x8_t c); // VMLA.I8 d0,d0,d0
uint16x4_t vmla_u16(uint16x4_t a, uint16x4_t b, uint16x4_t c); // VMLA.I16 d0,d0,d0
uint32x2_t vmla_u32(uint32x2_t a, uint32x2_t b, uint32x2_t c); // VMLA.I32 d0,d0,d0
int8x16_t vmlaq_s8(int8x16_t a, int8x16_t b, int8x16_t c); // VMLA.I8 q0,q0,q0
int16x8_t vmlaq_s16(int16x8_t a, int16x8_t b, int16x8_t c); // VMLA.I16 q0,q0,q0
int32x4_t vmlaq_s32(int32x4_t a, int32x4_t b, int32x4_t c); // VMLA.I32 q0,q0,q0
float32x4_t vmlaq_f32(float32x4_t a, float32x4_t b, float32x4_t c); // VMLA.F32 q0,q0,q0
uint8x16_t vmlaq_u8(uint8x16_t a, uint8x16_t b, uint8x16_t c); // VMLA.I8 q0,q0,q0
uint16x8_t vmlaq_u16(uint16x8_t a, uint16x8_t b, uint16x8_t c); // VMLA.I16 q0,q0,q0
uint32x4_t vmlaq_u32(uint32x4_t a, uint32x4_t b, uint32x4_t c); // VMLA.I32 q0,q0,q0
//Vector multiply accumulate long: vmlal -> Vr[i] := Va[i] + Vb[i] * Vc[i]
int16x8_t vmlal_s8(int16x8_t a, int8x8_t b, int8x8_t c); // VMLAL.S8 q0,d0,d0
int32x4_t vmlal_s16(int32x4_t a, int16x4_t b, int16x4_t c); // VMLAL.S16 q0,d0,d0
int64x2_t vmlal_s32(int64x2_t a, int32x2_t b, int32x2_t c); // VMLAL.S32 q0,d0,d0
uint16x8_t vmlal_u8(uint16x8_t a, uint8x8_t b, uint8x8_t c); // VMLAL.U8 q0,d0,d0
uint32x4_t vmlal_u16(uint32x4_t a, uint16x4_t b, uint16x4_t c); // VMLAL.U16 q0,d0,d0
uint64x2_t vmlal_u32(uint64x2_t a, uint32x2_t b, uint32x2_t c); // VMLAL.U32 q0,d0,d0
//Vector multiply subtract: vmls -> Vr[i] := Va[i] - Vb[i] * Vc[i]
int8x8_t vmls_s8(int8x8_t a, int8x8_t b, int8x8_t c); // VMLS.I8 d0,d0,d0
int16x4_t vmls_s16(int16x4_t a, int16x4_t b, int16x4_t c); // VMLS.I16 d0,d0,d0
int32x2_t vmls_s32(int32x2_t a, int32x2_t b, int32x2_t c); // VMLS.I32 d0,d0,d0
float32x2_t vmls_f32(float32x2_t a, float32x2_t b, float32x2_t c); // VMLS.F32 d0,d0,d0
uint8x8_t vmls_u8(uint8x8_t a, uint8x8_t b, uint8x8_t c); // VMLS.I8 d0,d0,d0
uint16x4_t vmls_u16(uint16x4_t a, uint16x4_t b, uint16x4_t c); // VMLS.I16 d0,d0,d0
uint32x2_t vmls_u32(uint32x2_t a, uint32x2_t b, uint32x2_t c); // VMLS.I32 d0,d0,d0
int8x16_t vmlsq_s8(int8x16_t a, int8x16_t b, int8x16_t c); // VMLS.I8 q0,q0,q0
int16x8_t vmlsq_s16(int16x8_t a, int16x8_t b, int16x8_t c); // VMLS.I16 q0,q0,q0
int32x4_t vmlsq_s32(int32x4_t a, int32x4_t b, int32x4_t c); // VMLS.I32 q0,q0,q0
float32x4_t vmlsq_f32(float32x4_t a, float32x4_t b, float32x4_t c); // VMLS.F32 q0,q0,q0
uint8x16_t vmlsq_u8(uint8x16_t a, uint8x16_t b, uint8x16_t c); // VMLS.I8 q0,q0,q0
uint16x8_t vmlsq_u16(uint16x8_t a, uint16x8_t b, uint16x8_t c); // VMLS.I16 q0,q0,q0
uint32x4_t vmlsq_u32(uint32x4_t a, uint32x4_t b, uint32x4_t c); // VMLS.I32 q0,q0,q0
//Vector multiply subtract long
int16x8_t vmlsl_s8(int16x8_t a, int8x8_t b, int8x8_t c); // VMLSL.S8 q0,d0,d0
int32x4_t vmlsl_s16(int32x4_t a, int16x4_t b, int16x4_t c); // VMLSL.S16 q0,d0,d0
int64x2_t vmlsl_s32(int64x2_t a, int32x2_t b, int32x2_t c); // VMLSL.S32 q0,d0,d0
uint16x8_t vmlsl_u8(uint16x8_t a, uint8x8_t b, uint8x8_t c); // VMLSL.U8 q0,d0,d0
uint32x4_t vmlsl_u16(uint32x4_t a, uint16x4_t b, uint16x4_t c); // VMLSL.U16 q0,d0,d0
uint64x2_t vmlsl_u32(uint64x2_t a, uint32x2_t b, uint32x2_t c); // VMLSL.U32 q0,d0,d0
//Vector saturating doubling multiply high
int16x4_t vqdmulh_s16(int16x4_t a, int16x4_t b); // VQDMULH.S16 d0,d0,d0
int32x2_t vqdmulh_s32(int32x2_t a, int32x2_t b); // VQDMULH.S32 d0,d0,d0
int16x8_t vqdmulhq_s16(int16x8_t a, int16x8_t b); // VQDMULH.S16 q0,q0,q0
int32x4_t vqdmulhq_s32(int32x4_t a, int32x4_t b); // VQDMULH.S32 q0,q0,q0
//Vector saturating rounding doubling multiply high
int16x4_t vqrdmulh_s16(int16x4_t a, int16x4_t b); // VQRDMULH.S16 d0,d0,d0
int32x2_t vqrdmulh_s32(int32x2_t a, int32x2_t b); // VQRDMULH.S32 d0,d0,d0
int16x8_t vqrdmulhq_s16(int16x8_t a, int16x8_t b); // VQRDMULH.S16 q0,q0,q0
int32x4_t vqrdmulhq_s32(int32x4_t a, int32x4_t b); // VQRDMULH.S32 q0,q0,q0
//Vector saturating doubling multiply accumulate long
int32x4_t vqdmlal_s16(int32x4_t a, int16x4_t b, int16x4_t c); // VQDMLAL.S16 q0,d0,d0
int64x2_t vqdmlal_s32(int64x2_t a, int32x2_t b, int32x2_t c); // VQDMLAL.S32 q0,d0,d0
//Vector saturating doubling multiply subtract long
int32x4_t vqdmlsl_s16(int32x4_t a, int16x4_t b, int16x4_t c); // VQDMLSL.S16 q0,d0,d0
int64x2_t vqdmlsl_s32(int64x2_t a, int32x2_t b, int32x2_t c); // VQDMLSL.S32 q0,d0,d0
//Vector long multiply
int16x8_t vmull_s8(int8x8_t a, int8x8_t b); // VMULL.S8 q0,d0,d0
int32x4_t vmull_s16(int16x4_t a, int16x4_t b); // VMULL.S16 q0,d0,d0
int64x2_t vmull_s32(int32x2_t a, int32x2_t b); // VMULL.S32 q0,d0,d0
uint16x8_t vmull_u8(uint8x8_t a, uint8x8_t b); // VMULL.U8 q0,d0,d0
uint32x4_t vmull_u16(uint16x4_t a, uint16x4_t b); // VMULL.U16 q0,d0,d0
uint64x2_t vmull_u32(uint32x2_t a, uint32x2_t b); // VMULL.U32 q0,d0,d0
poly16x8_t vmull_p8(poly8x8_t a, poly8x8_t b); // VMULL.P8 q0,d0,d0
//Vector saturating doubling long multiply
int32x4_t vqdmull_s16(int16x4_t a, int16x4_t b); // VQDMULL.S16 q0,d0,d0
int64x2_t vqdmull_s32(int32x2_t a, int32x2_t b); // VQDMULL.S32 q0,d0,d0
//Subtraction
//Vector subtract
int8x8_t vsub_s8(int8x8_t a, int8x8_t b); // VSUB.I8 d0,d0,d0
int16x4_t vsub_s16(int16x4_t a, int16x4_t b); // VSUB.I16 d0,d0,d0
int32x2_t vsub_s32(int32x2_t a, int32x2_t b); // VSUB.I32 d0,d0,d0
int64x1_t vsub_s64(int64x1_t a, int64x1_t b); // VSUB.I64 d0,d0,d0
float32x2_t vsub_f32(float32x2_t a, float32x2_t b); // VSUB.F32 d0,d0,d0
uint8x8_t vsub_u8(uint8x8_t a, uint8x8_t b); // VSUB.I8 d0,d0,d0
uint16x4_t vsub_u16(uint16x4_t a, uint16x4_t b); // VSUB.I16 d0,d0,d0
uint32x2_t vsub_u32(uint32x2_t a, uint32x2_t b); // VSUB.I32 d0,d0,d0
uint64x1_t vsub_u64(uint64x1_t a, uint64x1_t b); // VSUB.I64 d0,d0,d0
int8x16_t vsubq_s8(int8x16_t a, int8x16_t b); // VSUB.I8 q0,q0,q0
int16x8_t vsubq_s16(int16x8_t a, int16x8_t b); // VSUB.I16 q0,q0,q0
int32x4_t vsubq_s32(int32x4_t a, int32x4_t b); // VSUB.I32 q0,q0,q0
int64x2_t vsubq_s64(int64x2_t a, int64x2_t b); // VSUB.I64 q0,q0,q0
float32x4_t vsubq_f32(float32x4_t a, float32x4_t b); // VSUB.F32 q0,q0,q0
uint8x16_t vsubq_u8(uint8x16_t a, uint8x16_t b); // VSUB.I8 q0,q0,q0
uint16x8_t vsubq_u16(uint16x8_t a, uint16x8_t b); // VSUB.I16 q0,q0,q0
uint32x4_t vsubq_u32(uint32x4_t a, uint32x4_t b); // VSUB.I32 q0,q0,q0
uint64x2_t vsubq_u64(uint64x2_t a, uint64x2_t b); // VSUB.I64 q0,q0,q0
//Vector long subtract: vsub -> Vr[i]:=Va[i]+Vb[i]
int16x8_t vsubl_s8(int8x8_t a, int8x8_t b); // VSUBL.S8 q0,d0,d0
int32x4_t vsubl_s16(int16x4_t a, int16x4_t b); // VSUBL.S16 q0,d0,d0
int64x2_t vsubl_s32(int32x2_t a, int32x2_t b); // VSUBL.S32 q0,d0,d0
uint16x8_t vsubl_u8(uint8x8_t a, uint8x8_t b); // VSUBL.U8 q0,d0,d0
uint32x4_t vsubl_u16(uint16x4_t a, uint16x4_t b); // VSUBL.U16 q0,d0,d0
uint64x2_t vsubl_u32(uint32x2_t a, uint32x2_t b); // VSUBL.U32 q0,d0,d0
//Vector wide subtract: vsub -> Vr[i]:=Va[i]+Vb[i]
int16x8_t vsubw_s8(int16x8_t a, int8x8_t b); // VSUBW.S8 q0,q0,d0
int32x4_t vsubw_s16(int32x4_t a, int16x4_t b); // VSUBW.S16 q0,q0,d0
int64x2_t vsubw_s32(int64x2_t a, int32x2_t b); // VSUBW.S32 q0,q0,d0
uint16x8_t vsubw_u8(uint16x8_t a, uint8x8_t b); // VSUBW.U8 q0,q0,d0
uint32x4_t vsubw_u16(uint32x4_t a, uint16x4_t b); // VSUBW.U16 q0,q0,d0
uint64x2_t vsubw_u32(uint64x2_t a, uint32x2_t b); // VSUBW.U32 q0,q0,d0
//Vector saturating subtract
int8x8_t vqsub_s8(int8x8_t a, int8x8_t b); // VQSUB.S8 d0,d0,d0
int16x4_t vqsub_s16(int16x4_t a, int16x4_t b); // VQSUB.S16 d0,d0,d0
int32x2_t vqsub_s32(int32x2_t a, int32x2_t b); // VQSUB.S32 d0,d0,d0
int64x1_t vqsub_s64(int64x1_t a, int64x1_t b); // VQSUB.S64 d0,d0,d0
uint8x8_t vqsub_u8(uint8x8_t a, uint8x8_t b); // VQSUB.U8 d0,d0,d0
uint16x4_t vqsub_u16(uint16x4_t a, uint16x4_t b); // VQSUB.U16 d0,d0,d0
uint32x2_t vqsub_u32(uint32x2_t a, uint32x2_t b); // VQSUB.U32 d0,d0,d0
uint64x1_t vqsub_u64(uint64x1_t a, uint64x1_t b); // VQSUB.U64 d0,d0,d0
int8x16_t vqsubq_s8(int8x16_t a, int8x16_t b); // VQSUB.S8 q0,q0,q0
int16x8_t vqsubq_s16(int16x8_t a, int16x8_t b); // VQSUB.S16 q0,q0,q0
int32x4_t vqsubq_s32(int32x4_t a, int32x4_t b); // VQSUB.S32 q0,q0,q0
int64x2_t vqsubq_s64(int64x2_t a, int64x2_t b); // VQSUB.S64 q0,q0,q0
uint8x16_t vqsubq_u8(uint8x16_t a, uint8x16_t b); // VQSUB.U8 q0,q0,q0
uint16x8_t vqsubq_u16(uint16x8_t a, uint16x8_t b); // VQSUB.U16 q0,q0,q0
uint32x4_t vqsubq_u32(uint32x4_t a, uint32x4_t b); // VQSUB.U32 q0,q0,q0
uint64x2_t vqsubq_u64(uint64x2_t a, uint64x2_t b); // VQSUB.U64 q0,q0,q0
//Vector halving subtract
int8x8_t vhsub_s8(int8x8_t a, int8x8_t b); // VHSUB.S8 d0,d0,d0
int16x4_t vhsub_s16(int16x4_t a, int16x4_t b); // VHSUB.S16 d0,d0,d0
int32x2_t vhsub_s32(int32x2_t a, int32x2_t b); // VHSUB.S32 d0,d0,d0
uint8x8_t vhsub_u8(uint8x8_t a, uint8x8_t b); // VHSUB.U8 d0,d0,d0
uint16x4_t vhsub_u16(uint16x4_t a, uint16x4_t b); // VHSUB.U16 d0,d0,d0
uint32x2_t vhsub_u32(uint32x2_t a, uint32x2_t b); // VHSUB.U32 d0,d0,d0
int8x16_t vhsubq_s8(int8x16_t a, int8x16_t b); // VHSUB.S8 q0,q0,q0
int16x8_t vhsubq_s16(int16x8_t a, int16x8_t b); // VHSUB.S16 q0,q0,q0
int32x4_t vhsubq_s32(int32x4_t a, int32x4_t b); // VHSUB.S32 q0,q0,q0
uint8x16_t vhsubq_u8(uint8x16_t a, uint8x16_t b); // VHSUB.U8 q0,q0,q0
uint16x8_t vhsubq_u16(uint16x8_t a, uint16x8_t b); // VHSUB.U16 q0,q0,q0
uint32x4_t vhsubq_u32(uint32x4_t a, uint32x4_t b); // VHSUB.U32 q0,q0,q0
//Vector subtract high half
int8x8_t vsubhn_s16(int16x8_t a, int16x8_t b); // VSUBHN.I16 d0,q0,q0
int16x4_t vsubhn_s32(int32x4_t a, int32x4_t b); // VSUBHN.I32 d0,q0,q0
int32x2_t vsubhn_s64(int64x2_t a, int64x2_t b); // VSUBHN.I64 d0,q0,q0
uint8x8_t vsubhn_u16(uint16x8_t a, uint16x8_t b); // VSUBHN.I16 d0,q0,q0
uint16x4_t vsubhn_u32(uint32x4_t a, uint32x4_t b); // VSUBHN.I32 d0,q0,q0
uint32x2_t vsubhn_u64(uint64x2_t a, uint64x2_t b); // VSUBHN.I64 d0,q0,q0
//Vector rounding subtract high half
int8x8_t vrsubhn_s16(int16x8_t a, int16x8_t b); // VRSUBHN.I16 d0,q0,q0
int16x4_t vrsubhn_s32(int32x4_t a, int32x4_t b); // VRSUBHN.I32 d0,q0,q0
int32x2_t vrsubhn_s64(int64x2_t a, int64x2_t b); // VRSUBHN.I64 d0,q0,q0
uint8x8_t vrsubhn_u16(uint16x8_t a, uint16x8_t b); // VRSUBHN.I16 d0,q0,q0
uint16x4_t vrsubhn_u32(uint32x4_t a, uint32x4_t b); // VRSUBHN.I32 d0,q0,q0
uint32x2_t vrsubhn_u64(uint64x2_t a, uint64x2_t b); // VRSUBHN.I64 d0,q0,q0
//Comparison
//Vector compare equal
uint8x8_t vceq_s8(int8x8_t a, int8x8_t b); // VCEQ.I8 d0, d0, d0
uint16x4_t vceq_s16(int16x4_t a, int16x4_t b); // VCEQ.I16 d0, d0, d0
uint32x2_t vceq_s32(int32x2_t a, int32x2_t b); // VCEQ.I32 d0, d0, d0
uint32x2_t vceq_f32(float32x2_t a, float32x2_t b); // VCEQ.F32 d0, d0, d0
uint8x8_t vceq_u8(uint8x8_t a, uint8x8_t b); // VCEQ.I8 d0, d0, d0
uint16x4_t vceq_u16(uint16x4_t a, uint16x4_t b); // VCEQ.I16 d0, d0, d0
uint32x2_t vceq_u32(uint32x2_t a, uint32x2_t b); // VCEQ.I32 d0, d0, d0
uint8x8_t vceq_p8(poly8x8_t a, poly8x8_t b); // VCEQ.I8 d0, d0, d0
uint8x16_t vceqq_s8(int8x16_t a, int8x16_t b); // VCEQ.I8 q0, q0, q0
uint16x8_t vceqq_s16(int16x8_t a, int16x8_t b); // VCEQ.I16 q0, q0, q0
uint32x4_t vceqq_s32(int32x4_t a, int32x4_t b); // VCEQ.I32 q0, q0, q0
uint32x4_t vceqq_f32(float32x4_t a, float32x4_t b); // VCEQ.F32 q0, q0, q0
uint8x16_t vceqq_u8(uint8x16_t a, uint8x16_t b); // VCEQ.I8 q0, q0, q0
uint16x8_t vceqq_u16(uint16x8_t a, uint16x8_t b); // VCEQ.I16 q0, q0, q0
uint32x4_t vceqq_u32(uint32x4_t a, uint32x4_t b); // VCEQ.I32 q0, q0, q0
uint8x16_t vceqq_p8(poly8x16_t a, poly8x16_t b); // VCEQ.I8 q0, q0, q0
//Vector compare greater-than or equal
uint8x8_t vcge_s8(int8x8_t a, int8x8_t b); // VCGE.S8 d0, d0, d0
uint16x4_t vcge_s16(int16x4_t a, int16x4_t b); // VCGE.S16 d0, d0, d0
uint32x2_t vcge_s32(int32x2_t a, int32x2_t b); // VCGE.S32 d0, d0, d0
uint32x2_t vcge_f32(float32x2_t a, float32x2_t b); // VCGE.F32 d0, d0, d0
uint8x8_t vcge_u8(uint8x8_t a, uint8x8_t b); // VCGE.U8 d0, d0, d0
uint16x4_t vcge_u16(uint16x4_t a, uint16x4_t b); // VCGE.U16 d0, d0, d0
uint32x2_t vcge_u32(uint32x2_t a, uint32x2_t b); // VCGE.U32 d0, d0, d0
uint8x16_t vcgeq_s8(int8x16_t a, int8x16_t b); // VCGE.S8 q0, q0, q0
uint16x8_t vcgeq_s16(int16x8_t a, int16x8_t b); // VCGE.S16 q0, q0, q0
uint32x4_t vcgeq_s32(int32x4_t a, int32x4_t b); // VCGE.S32 q0, q0, q0
uint32x4_t vcgeq_f32(float32x4_t a, float32x4_t b); // VCGE.F32 q0, q0, q0
uint8x16_t vcgeq_u8(uint8x16_t a, uint8x16_t b); // VCGE.U8 q0, q0, q0
uint16x8_t vcgeq_u16(uint16x8_t a, uint16x8_t b); // VCGE.U16 q0, q0, q0
uint32x4_t vcgeq_u32(uint32x4_t a, uint32x4_t b); // VCGE.U32 q0, q0, q0
//Vector compare less-than or equal
uint8x8_t vcle_s8(int8x8_t a, int8x8_t b); // VCGE.S8 d0, d0, d0
uint16x4_t vcle_s16(int16x4_t a, int16x4_t b); // VCGE.S16 d0, d0, d0
uint32x2_t vcle_s32(int32x2_t a, int32x2_t b); // VCGE.S32 d0, d0, d0
uint32x2_t vcle_f32(float32x2_t a, float32x2_t b); // VCGE.F32 d0, d0, d0
uint8x8_t vcle_u8(uint8x8_t a, uint8x8_t b); // VCGE.U8 d0, d0, d0
uint16x4_t vcle_u16(uint16x4_t a, uint16x4_t b); // VCGE.U16 d0, d0, d0
uint32x2_t vcle_u32(uint32x2_t a, uint32x2_t b); // VCGE.U32 d0, d0, d0
uint8x16_t vcleq_s8(int8x16_t a, int8x16_t b); // VCGE.S8 q0, q0, q0
uint16x8_t vcleq_s16(int16x8_t a, int16x8_t b); // VCGE.S16 q0, q0, q0
uint32x4_t vcleq_s32(int32x4_t a, int32x4_t b); // VCGE.S32 q0, q0, q0
uint32x4_t vcleq_f32(float32x4_t a, float32x4_t b); // VCGE.F32 q0, q0, q0
uint8x16_t vcleq_u8(uint8x16_t a, uint8x16_t b); // VCGE.U8 q0, q0, q0
uint16x8_t vcleq_u16(uint16x8_t a, uint16x8_t b); // VCGE.U16 q0, q0, q0
uint32x4_t vcleq_u32(uint32x4_t a, uint32x4_t b); // VCGE.U32 q0, q0, q0
//Vector compare greater-than
uint8x8_t vcgt_s8(int8x8_t a, int8x8_t b); // VCGT.S8 d0, d0, d0
uint16x4_t vcgt_s16(int16x4_t a, int16x4_t b); // VCGT.S16 d0, d0, d0
uint32x2_t vcgt_s32(int32x2_t a, int32x2_t b); // VCGT.S32 d0, d0, d0
uint32x2_t vcgt_f32(float32x2_t a, float32x2_t b); // VCGT.F32 d0, d0, d0
uint8x8_t vcgt_u8(uint8x8_t a, uint8x8_t b); // VCGT.U8 d0, d0, d0
uint16x4_t vcgt_u16(uint16x4_t a, uint16x4_t b); // VCGT.U16 d0, d0, d0
uint32x2_t vcgt_u32(uint32x2_t a, uint32x2_t b); // VCGT.U32 d0, d0, d0
uint8x16_t vcgtq_s8(int8x16_t a, int8x16_t b); // VCGT.S8 q0, q0, q0
uint16x8_t vcgtq_s16(int16x8_t a, int16x8_t b); // VCGT.S16 q0, q0, q0
uint32x4_t vcgtq_s32(int32x4_t a, int32x4_t b); // VCGT.S32 q0, q0, q0
uint32x4_t vcgtq_f32(float32x4_t a, float32x4_t b); // VCGT.F32 q0, q0, q0
uint8x16_t vcgtq_u8(uint8x16_t a, uint8x16_t b); // VCGT.U8 q0, q0, q0
uint16x8_t vcgtq_u16(uint16x8_t a, uint16x8_t b); // VCGT.U16 q0, q0, q0
uint32x4_t vcgtq_u32(uint32x4_t a, uint32x4_t b); // VCGT.U32 q0, q0, q0
//Vector compare less-than
uint8x8_t vclt_s8(int8x8_t a, int8x8_t b); // VCGT.S8 d0, d0, d0
uint16x4_t vclt_s16(int16x4_t a, int16x4_t b); // VCGT.S16 d0, d0, d0
uint32x2_t vclt_s32(int32x2_t a, int32x2_t b); // VCGT.S32 d0, d0, d0
uint32x2_t vclt_f32(float32x2_t a, float32x2_t b); // VCGT.F32 d0, d0, d0
uint8x8_t vclt_u8(uint8x8_t a, uint8x8_t b); // VCGT.U8 d0, d0, d0
uint16x4_t vclt_u16(uint16x4_t a, uint16x4_t b); // VCGT.U16 d0, d0, d0
uint32x2_t vclt_u32(uint32x2_t a, uint32x2_t b); // VCGT.U32 d0, d0, d0
uint8x16_t vcltq_s8(int8x16_t a, int8x16_t b); // VCGT.S8 q0, q0, q0
uint16x8_t vcltq_s16(int16x8_t a, int16x8_t b); // VCGT.S16 q0, q0, q0
uint32x4_t vcltq_s32(int32x4_t a, int32x4_t b); // VCGT.S32 q0, q0, q0
uint32x4_t vcltq_f32(float32x4_t a, float32x4_t b); // VCGT.F32 q0, q0, q0
uint8x16_t vcltq_u8(uint8x16_t a, uint8x16_t b); // VCGT.U8 q0, q0, q0
uint16x8_t vcltq_u16(uint16x8_t a, uint16x8_t b); // VCGT.U16 q0, q0, q0
uint32x4_t vcltq_u32(uint32x4_t a, uint32x4_t b); // VCGT.U32 q0, q0, q0
//Vector compare absolute greater-than or equal
uint32x2_t vcage_f32(float32x2_t a, float32x2_t b); // VACGE.F32 d0, d0, d0
uint32x4_t vcageq_f32(float32x4_t a, float32x4_t b); // VACGE.F32 q0, q0, q0
//Vector compare absolute less-than or equal
uint32x2_t vcale_f32(float32x2_t a, float32x2_t b); // VACGE.F32 d0, d0, d0
uint32x4_t vcaleq_f32(float32x4_t a, float32x4_t b); // VACGE.F32 q0, q0, q0
//Vector compare absolute greater-than
uint32x2_t vcagt_f32(float32x2_t a, float32x2_t b); // VACGT.F32 d0, d0, d0
uint32x4_t vcagtq_f32(float32x4_t a, float32x4_t b); // VACGT.F32 q0, q0, q0
//Vector compare absolute less-than
uint32x2_t vcalt_f32(float32x2_t a, float32x2_t b); // VACGT.F32 d0, d0, d0
uint32x4_t vcaltq_f32(float32x4_t a, float32x4_t b); // VACGT.F32 q0, q0, q0
//Vector test bits
uint8x8_t vtst_s8(int8x8_t a, int8x8_t b); // VTST.8 d0, d0, d0
uint16x4_t vtst_s16(int16x4_t a, int16x4_t b); // VTST.16 d0, d0, d0
uint32x2_t vtst_s32(int32x2_t a, int32x2_t b); // VTST.32 d0, d0, d0
uint8x8_t vtst_u8(uint8x8_t a, uint8x8_t b); // VTST.8 d0, d0, d0
uint16x4_t vtst_u16(uint16x4_t a, uint16x4_t b); // VTST.16 d0, d0, d0
uint32x2_t vtst_u32(uint32x2_t a, uint32x2_t b); // VTST.32 d0, d0, d0
uint8x8_t vtst_p8(poly8x8_t a, poly8x8_t b); // VTST.8 d0, d0, d0
uint8x16_t vtstq_s8(int8x16_t a, int8x16_t b); // VTST.8 q0, q0, q0
uint16x8_t vtstq_s16(int16x8_t a, int16x8_t b); // VTST.16 q0, q0, q0
uint32x4_t vtstq_s32(int32x4_t a, int32x4_t b); // VTST.32 q0, q0, q0
uint8x16_t vtstq_u8(uint8x16_t a, uint8x16_t b); // VTST.8 q0, q0, q0
uint16x8_t vtstq_u16(uint16x8_t a, uint16x8_t b); // VTST.16 q0, q0, q0
uint32x4_t vtstq_u32(uint32x4_t a, uint32x4_t b); // VTST.32 q0, q0, q0
uint8x16_t vtstq_p8(poly8x16_t a, poly8x16_t b); // VTST.8 q0, q0, q0
//Absolute difference
//Absolute difference between the arguments: Vr[i] = | Va[i] - Vb[i] |
int8x8_t vabd_s8(int8x8_t a, int8x8_t b); // VABD.S8 d0,d0,d0
int16x4_t vabd_s16(int16x4_t a, int16x4_t b); // VABD.S16 d0,d0,d0
int32x2_t vabd_s32(int32x2_t a, int32x2_t b); // VABD.S32 d0,d0,d0
uint8x8_t vabd_u8(uint8x8_t a, uint8x8_t b); // VABD.U8 d0,d0,d0
uint16x4_t vabd_u16(uint16x4_t a, uint16x4_t b); // VABD.U16 d0,d0,d0
uint32x2_t vabd_u32(uint32x2_t a, uint32x2_t b); // VABD.U32 d0,d0,d0
float32x2_t vabd_f32(float32x2_t a, float32x2_t b); // VABD.F32 d0,d0,d0
int8x16_t vabdq_s8(int8x16_t a, int8x16_t b); // VABD.S8 q0,q0,q0
int16x8_t vabdq_s16(int16x8_t a, int16x8_t b); // VABD.S16 q0,q0,q0
int32x4_t vabdq_s32(int32x4_t a, int32x4_t b); // VABD.S32 q0,q0,q0
uint8x16_t vabdq_u8(uint8x16_t a, uint8x16_t b); // VABD.U8 q0,q0,q0
uint16x8_t vabdq_u16(uint16x8_t a, uint16x8_t b); // VABD.U16 q0,q0,q0
uint32x4_t vabdq_u32(uint32x4_t a, uint32x4_t b); // VABD.U32 q0,q0,q0
float32x4_t vabdq_f32(float32x4_t a, float32x4_t b); // VABD.F32 q0,q0,q0
//Absolute difference - long
int16x8_t vabdl_s8(int8x8_t a, int8x8_t b); // VABDL.S8 q0,d0,d0
int32x4_t vabdl_s16(int16x4_t a, int16x4_t b); // VABDL.S16 q0,d0,d0
int64x2_t vabdl_s32(int32x2_t a, int32x2_t b); // VABDL.S32 q0,d0,d0
uint16x8_t vabdl_u8(uint8x8_t a, uint8x8_t b); // VABDL.U8 q0,d0,d0
uint32x4_t vabdl_u16(uint16x4_t a, uint16x4_t b); // VABDL.U16 q0,d0,d0
uint64x2_t vabdl_u32(uint32x2_t a, uint32x2_t b); // VABDL.U32 q0,d0,d0
//Absolute difference and accumulate: Vr[i] = Va[i] + | Vb[i] - Vc[i] |
int8x8_t vaba_s8(int8x8_t a, int8x8_t b, int8x8_t c); // VABA.S8 d0,d0,d0
int16x4_t vaba_s16(int16x4_t a, int16x4_t b, int16x4_t c); // VABA.S16 d0,d0,d0
int32x2_t vaba_s32(int32x2_t a, int32x2_t b, int32x2_t c); // VABA.S32 d0,d0,d0
uint8x8_t vaba_u8(uint8x8_t a, uint8x8_t b, uint8x8_t c); // VABA.U8 d0,d0,d0
uint16x4_t vaba_u16(uint16x4_t a, uint16x4_t b, uint16x4_t c); // VABA.U16 d0,d0,d0
uint32x2_t vaba_u32(uint32x2_t a, uint32x2_t b, uint32x2_t c); // VABA.U32 d0,d0,d0
int8x16_t vabaq_s8(int8x16_t a, int8x16_t b, int8x16_t c); // VABA.S8 q0,q0,q0
int16x8_t vabaq_s16(int16x8_t a, int16x8_t b, int16x8_t c); // VABA.S16 q0,q0,q0
int32x4_t vabaq_s32(int32x4_t a, int32x4_t b, int32x4_t c); // VABA.S32 q0,q0,q0
uint8x16_t vabaq_u8(uint8x16_t a, uint8x16_t b, uint8x16_t c); // VABA.U8 q0,q0,q0
uint16x8_t vabaq_u16(uint16x8_t a, uint16x8_t b, uint16x8_t c); // VABA.U16 q0,q0,q0
uint32x4_t vabaq_u32(uint32x4_t a, uint32x4_t b, uint32x4_t c); // VABA.U32 q0,q0,q0
//Absolute difference and accumulate - long
int16x8_t vabal_s8(int16x8_t a, int8x8_t b, int8x8_t c); // VABAL.S8 q0,d0,d0
int32x4_t vabal_s16(int32x4_t a, int16x4_t b, int16x4_t c); // VABAL.S16 q0,d0,d0
int64x2_t vabal_s32(int64x2_t a, int32x2_t b, int32x2_t c); // VABAL.S32 q0,d0,d0
uint16x8_t vabal_u8(uint16x8_t a, uint8x8_t b, uint8x8_t c); // VABAL.U8 q0,d0,d0
uint32x4_t vabal_u16(uint32x4_t a, uint16x4_t b, uint16x4_t c); // VABAL.U16 q0,d0,d0
uint64x2_t vabal_u32(uint64x2_t a, uint32x2_t b, uint32x2_t c); // VABAL.U32 q0,d0,d0
//Max/Min
//vmax -> Vr[i] := (Va[i] >= Vb[i]) ? Va[i] : Vb[i]
int8x8_t vmax_s8(int8x8_t a, int8x8_t b); // VMAX.S8 d0,d0,d0
int16x4_t vmax_s16(int16x4_t a, int16x4_t b); // VMAX.S16 d0,d0,d0
int32x2_t vmax_s32(int32x2_t a, int32x2_t b); // VMAX.S32 d0,d0,d0
uint8x8_t vmax_u8(uint8x8_t a, uint8x8_t b); // VMAX.U8 d0,d0,d0
uint16x4_t vmax_u16(uint16x4_t a, uint16x4_t b); // VMAX.U16 d0,d0,d0
uint32x2_t vmax_u32(uint32x2_t a, uint32x2_t b); // VMAX.U32 d0,d0,d0
float32x2_t vmax_f32(float32x2_t a, float32x2_t b); // VMAX.F32 d0,d0,d0
int8x16_t vmaxq_s8(int8x16_t a, int8x16_t b); // VMAX.S8 q0,q0,q0
int16x8_t vmaxq_s16(int16x8_t a, int16x8_t b); // VMAX.S16 q0,q0,q0
int32x4_t vmaxq_s32(int32x4_t a, int32x4_t b); // VMAX.S32 q0,q0,q0
uint8x16_t vmaxq_u8(uint8x16_t a, uint8x16_t b); // VMAX.U8 q0,q0,q0
uint16x8_t vmaxq_u16(uint16x8_t a, uint16x8_t b); // VMAX.U16 q0,q0,q0
uint32x4_t vmaxq_u32(uint32x4_t a, uint32x4_t b); // VMAX.U32 q0,q0,q0
float32x4_t vmaxq_f32(float32x4_t a, float32x4_t b); // VMAX.F32 q0,q0,q0
//vmin -> Vr[i] := (Va[i] >= Vb[i]) ? Vb[i] : Va[i]
int8x8_t vmin_s8(int8x8_t a, int8x8_t b); // VMIN.S8 d0,d0,d0
int16x4_t vmin_s16(int16x4_t a, int16x4_t b); // VMIN.S16 d0,d0,d0
int32x2_t vmin_s32(int32x2_t a, int32x2_t b); // VMIN.S32 d0,d0,d0
uint8x8_t vmin_u8(uint8x8_t a, uint8x8_t b); // VMIN.U8 d0,d0,d0
uint16x4_t vmin_u16(uint16x4_t a, uint16x4_t b); // VMIN.U16 d0,d0,d0
uint32x2_t vmin_u32(uint32x2_t a, uint32x2_t b); // VMIN.U32 d0,d0,d0
float32x2_t vmin_f32(float32x2_t a, float32x2_t b); // VMIN.F32 d0,d0,d0
int8x16_t vminq_s8(int8x16_t a, int8x16_t b); // VMIN.S8 q0,q0,q0
int16x8_t vminq_s16(int16x8_t a, int16x8_t b); // VMIN.S16 q0,q0,q0
int32x4_t vminq_s32(int32x4_t a, int32x4_t b); // VMIN.S32 q0,q0,q0
uint8x16_t vminq_u8(uint8x16_t a, uint8x16_t b); // VMIN.U8 q0,q0,q0
uint16x8_t vminq_u16(uint16x8_t a, uint16x8_t b); // VMIN.U16 q0,q0,q0
uint32x4_t vminq_u32(uint32x4_t a, uint32x4_t b); // VMIN.U32 q0,q0,q0
float32x4_t vminq_f32(float32x4_t a, float32x4_t b); // VMIN.F32 q0,q0,q0
//Pairwise addition
//Pairwise add
int8x8_t vpadd_s8(int8x8_t a, int8x8_t b); // VPADD.I8 d0,d0,d0
int16x4_t vpadd_s16(int16x4_t a, int16x4_t b); // VPADD.I16 d0,d0,d0
int32x2_t vpadd_s32(int32x2_t a, int32x2_t b); // VPADD.I32 d0,d0,d0
uint8x8_t vpadd_u8(uint8x8_t a, uint8x8_t b); // VPADD.I8 d0,d0,d0
uint16x4_t vpadd_u16(uint16x4_t a, uint16x4_t b); // VPADD.I16 d0,d0,d0
uint32x2_t vpadd_u32(uint32x2_t a, uint32x2_t b); // VPADD.I32 d0,d0,d0
float32x2_t vpadd_f32(float32x2_t a, float32x2_t b); // VPADD.F32 d0,d0,d0
//Long pairwise add
int16x4_t vpaddl_s8(int8x8_t a); // VPADDL.S8 d0,d0
int32x2_t vpaddl_s16(int16x4_t a); // VPADDL.S16 d0,d0
int64x1_t vpaddl_s32(int32x2_t a); // VPADDL.S32 d0,d0
uint16x4_t vpaddl_u8(uint8x8_t a); // VPADDL.U8 d0,d0
uint32x2_t vpaddl_u16(uint16x4_t a); // VPADDL.U16 d0,d0
uint64x1_t vpaddl_u32(uint32x2_t a); // VPADDL.U32 d0,d0
int16x8_t vpaddlq_s8(int8x16_t a); // VPADDL.S8 q0,q0
int32x4_t vpaddlq_s16(int16x8_t a); // VPADDL.S16 q0,q0
int64x2_t vpaddlq_s32(int32x4_t a); // VPADDL.S32 q0,q0
uint16x8_t vpaddlq_u8(uint8x16_t a); // VPADDL.U8 q0,q0
uint32x4_t vpaddlq_u16(uint16x8_t a); // VPADDL.U16 q0,q0
uint64x2_t vpaddlq_u32(uint32x4_t a); // VPADDL.U32 q0,q0
//Long pairwise add and accumulate
int16x4_t vpadal_s8(int16x4_t a, int8x8_t b); // VPADAL.S8 d0,d0
int32x2_t vpadal_s16(int32x2_t a, int16x4_t b); // VPADAL.S16 d0,d0
int64x1_t vpadal_s32(int64x1_t a, int32x2_t b); // VPADAL.S32 d0,d0
uint16x4_t vpadal_u8(uint16x4_t a, uint8x8_t b); // VPADAL.U8 d0,d0
uint32x2_t vpadal_u16(uint32x2_t a, uint16x4_t b); // VPADAL.U16 d0,d0
uint64x1_t vpadal_u32(uint64x1_t a, uint32x2_t b); // VPADAL.U32 d0,d0
int16x8_t vpadalq_s8(int16x8_t a, int8x16_t b); // VPADAL.S8 q0,q0
int32x4_t vpadalq_s16(int32x4_t a, int16x8_t b); // VPADAL.S16 q0,q0
int64x2_t vpadalq_s32(int64x2_t a, int32x4_t b); // VPADAL.S32 q0,q0
uint16x8_t vpadalq_u8(uint16x8_t a, uint8x16_t b); // VPADAL.U8 q0,q0
uint32x4_t vpadalq_u16(uint32x4_t a, uint16x8_t b); // VPADAL.U16 q0,q0
uint64x2_t vpadalq_u32(uint64x2_t a, uint32x4_t b); // VPADAL.U32 q0,q0
//Folding maximum vpmax -> takes maximum of adjacent pairs
int8x8_t vpmax_s8(int8x8_t a, int8x8_t b); // VPMAX.S8 d0,d0,d0
int16x4_t vpmax_s16(int16x4_t a, int16x4_t b); // VPMAX.S16 d0,d0,d0
int32x2_t vpmax_s32(int32x2_t a, int32x2_t b); // VPMAX.S32 d0,d0,d0
uint8x8_t vpmax_u8(uint8x8_t a, uint8x8_t b); // VPMAX.U8 d0,d0,d0
uint16x4_t vpmax_u16(uint16x4_t a, uint16x4_t b); // VPMAX.U16 d0,d0,d0
uint32x2_t vpmax_u32(uint32x2_t a, uint32x2_t b); // VPMAX.U32 d0,d0,d0
float32x2_t vpmax_f32(float32x2_t a, float32x2_t b); // VPMAX.F32 d0,d0,d0
//Folding minimum vpmin -> takes minimum of adjacent pairs
int8x8_t vpmin_s8(int8x8_t a, int8x8_t b); // VPMIN.S8 d0,d0,d0
int16x4_t vpmin_s16(int16x4_t a, int16x4_t b); // VPMIN.S16 d0,d0,d0
int32x2_t vpmin_s32(int32x2_t a, int32x2_t b); // VPMIN.S32 d0,d0,d0
uint8x8_t vpmin_u8(uint8x8_t a, uint8x8_t b); // VPMIN.U8 d0,d0,d0
uint16x4_t vpmin_u16(uint16x4_t a, uint16x4_t b); // VPMIN.U16 d0,d0,d0
uint32x2_t vpmin_u32(uint32x2_t a, uint32x2_t b); // VPMIN.U32 d0,d0,d0
float32x2_t vpmin_f32(float32x2_t a, float32x2_t b); // VPMIN.F32 d0,d0,d0
//Reciprocal/Sqrt
float32x2_t vrecps_f32(float32x2_t a, float32x2_t b); // VRECPS.F32 d0, d0, d0
float32x4_t vrecpsq_f32(float32x4_t a, float32x4_t b); // VRECPS.F32 q0, q0, q0
float32x2_t vrsqrts_f32(float32x2_t a, float32x2_t b); // VRSQRTS.F32 d0, d0, d0
float32x4_t vrsqrtsq_f32(float32x4_t a, float32x4_t b); // VRSQRTS.F32 q0, q0, q0
//Shifts by signed variable
//Vector shift left: Vr[i] := Va[i] << Vb[i] (negative values shift right)
int8x8_t vshl_s8(int8x8_t a, int8x8_t b); // VSHL.S8 d0,d0,d0
int16x4_t vshl_s16(int16x4_t a, int16x4_t b); // VSHL.S16 d0,d0,d0
int32x2_t vshl_s32(int32x2_t a, int32x2_t b); // VSHL.S32 d0,d0,d0
int64x1_t vshl_s64(int64x1_t a, int64x1_t b); // VSHL.S64 d0,d0,d0
uint8x8_t vshl_u8(uint8x8_t a, int8x8_t b); // VSHL.U8 d0,d0,d0
uint16x4_t vshl_u16(uint16x4_t a, int16x4_t b); // VSHL.U16 d0,d0,d0
uint32x2_t vshl_u32(uint32x2_t a, int32x2_t b); // VSHL.U32 d0,d0,d0
uint64x1_t vshl_u64(uint64x1_t a, int64x1_t b); // VSHL.U64 d0,d0,d0
int8x16_t vshlq_s8(int8x16_t a, int8x16_t b); // VSHL.S8 q0,q0,q0
int16x8_t vshlq_s16(int16x8_t a, int16x8_t b); // VSHL.S16 q0,q0,q0
int32x4_t vshlq_s32(int32x4_t a, int32x4_t b); // VSHL.S32 q0,q0,q0
int64x2_t vshlq_s64(int64x2_t a, int64x2_t b); // VSHL.S64 q0,q0,q0
uint8x16_t vshlq_u8(uint8x16_t a, int8x16_t b); // VSHL.U8 q0,q0,q0
uint16x8_t vshlq_u16(uint16x8_t a, int16x8_t b); // VSHL.U16 q0,q0,q0
uint32x4_t vshlq_u32(uint32x4_t a, int32x4_t b); // VSHL.U32 q0,q0,q0
uint64x2_t vshlq_u64(uint64x2_t a, int64x2_t b); // VSHL.U64 q0,q0,q0
//Vector saturating shift left: (negative values shift right)
int8x8_t vqshl_s8(int8x8_t a, int8x8_t b); // VQSHL.S8 d0,d0,d0
int16x4_t vqshl_s16(int16x4_t a, int16x4_t b); // VQSHL.S16 d0,d0,d0
int32x2_t vqshl_s32(int32x2_t a, int32x2_t b); // VQSHL.S32 d0,d0,d0
int64x1_t vqshl_s64(int64x1_t a, int64x1_t b); // VQSHL.S64 d0,d0,d0
uint8x8_t vqshl_u8(uint8x8_t a, int8x8_t b); // VQSHL.U8 d0,d0,d0
uint16x4_t vqshl_u16(uint16x4_t a, int16x4_t b); // VQSHL.U16 d0,d0,d0
uint32x2_t vqshl_u32(uint32x2_t a, int32x2_t b); // VQSHL.U32 d0,d0,d0
uint64x1_t vqshl_u64(uint64x1_t a, int64x1_t b); // VQSHL.U64 d0,d0,d0
int8x16_t vqshlq_s8(int8x16_t a, int8x16_t b); // VQSHL.S8 q0,q0,q0
int16x8_t vqshlq_s16(int16x8_t a, int16x8_t b); // VQSHL.S16 q0,q0,q0
int32x4_t vqshlq_s32(int32x4_t a, int32x4_t b); // VQSHL.S32 q0,q0,q0
int64x2_t vqshlq_s64(int64x2_t a, int64x2_t b); // VQSHL.S64 q0,q0,q0
uint8x16_t vqshlq_u8(uint8x16_t a, int8x16_t b); // VQSHL.U8 q0,q0,q0
uint16x8_t vqshlq_u16(uint16x8_t a, int16x8_t b); // VQSHL.U16 q0,q0,q0
uint32x4_t vqshlq_u32(uint32x4_t a, int32x4_t b); // VQSHL.U32 q0,q0,q0
uint64x2_t vqshlq_u64(uint64x2_t a, int64x2_t b); // VQSHL.U64 q0,q0,q0
//Vector rounding shift left: (negative values shift right)
int8x8_t vrshl_s8(int8x8_t a, int8x8_t b); // VRSHL.S8 d0,d0,d0
int16x4_t vrshl_s16(int16x4_t a, int16x4_t b); // VRSHL.S16 d0,d0,d0
int32x2_t vrshl_s32(int32x2_t a, int32x2_t b); // VRSHL.S32 d0,d0,d0
int64x1_t vrshl_s64(int64x1_t a, int64x1_t b); // VRSHL.S64 d0,d0,d0
uint8x8_t vrshl_u8(uint8x8_t a, int8x8_t b); // VRSHL.U8 d0,d0,d0
uint16x4_t vrshl_u16(uint16x4_t a, int16x4_t b); // VRSHL.U16 d0,d0,d0
uint32x2_t vrshl_u32(uint32x2_t a, int32x2_t b); // VRSHL.U32 d0,d0,d0
uint64x1_t vrshl_u64(uint64x1_t a, int64x1_t b); // VRSHL.U64 d0,d0,d0
int8x16_t vrshlq_s8(int8x16_t a, int8x16_t b); // VRSHL.S8 q0,q0,q0
int16x8_t vrshlq_s16(int16x8_t a, int16x8_t b); // VRSHL.S16 q0,q0,q0
int32x4_t vrshlq_s32(int32x4_t a, int32x4_t b); // VRSHL.S32 q0,q0,q0
int64x2_t vrshlq_s64(int64x2_t a, int64x2_t b); // VRSHL.S64 q0,q0,q0
uint8x16_t vrshlq_u8(uint8x16_t a, int8x16_t b); // VRSHL.U8 q0,q0,q0
uint16x8_t vrshlq_u16(uint16x8_t a, int16x8_t b); // VRSHL.U16 q0,q0,q0
uint32x4_t vrshlq_u32(uint32x4_t a, int32x4_t b); // VRSHL.U32 q0,q0,q0
uint64x2_t vrshlq_u64(uint64x2_t a, int64x2_t b); // VRSHL.U64 q0,q0,q0
//Vector saturating rounding shift left: (negative values shift right)
int8x8_t vqrshl_s8(int8x8_t a, int8x8_t b); // VQRSHL.S8 d0,d0,d0
int16x4_t vqrshl_s16(int16x4_t a, int16x4_t b); // VQRSHL.S16 d0,d0,d0
int32x2_t vqrshl_s32(int32x2_t a, int32x2_t b); // VQRSHL.S32 d0,d0,d0
int64x1_t vqrshl_s64(int64x1_t a, int64x1_t b); // VQRSHL.S64 d0,d0,d0
uint8x8_t vqrshl_u8(uint8x8_t a, int8x8_t b); // VQRSHL.U8 d0,d0,d0
uint16x4_t vqrshl_u16(uint16x4_t a, int16x4_t b); // VQRSHL.U16 d0,d0,d0
uint32x2_t vqrshl_u32(uint32x2_t a, int32x2_t b); // VQRSHL.U32 d0,d0,d0
uint64x1_t vqrshl_u64(uint64x1_t a, int64x1_t b); // VQRSHL.U64 d0,d0,d0
int8x16_t vqrshlq_s8(int8x16_t a, int8x16_t b); // VQRSHL.S8 q0,q0,q0
int16x8_t vqrshlq_s16(int16x8_t a, int16x8_t b); // VQRSHL.S16 q0,q0,q0
int32x4_t vqrshlq_s32(int32x4_t a, int32x4_t b); // VQRSHL.S32 q0,q0,q0
int64x2_t vqrshlq_s64(int64x2_t a, int64x2_t b); // VQRSHL.S64 q0,q0,q0
uint8x16_t vqrshlq_u8(uint8x16_t a, int8x16_t b); // VQRSHL.U8 q0,q0,q0
uint16x8_t vqrshlq_u16(uint16x8_t a, int16x8_t b); // VQRSHL.U16 q0,q0,q0
uint32x4_t vqrshlq_u32(uint32x4_t a, int32x4_t b); // VQRSHL.U32 q0,q0,q0
uint64x2_t vqrshlq_u64(uint64x2_t a, int64x2_t b); // VQRSHL.U64 q0,q0,q0
//Shifts by a constant
//Vector shift right by constant
int8x8_t vshr_n_s8(int8x8_t a, __constrange(1,8) int b); // VSHR.S8 d0,d0,#8
int16x4_t vshr_n_s16(int16x4_t a, __constrange(1,16) int b); // VSHR.S16 d0,d0,#16
int32x2_t vshr_n_s32(int32x2_t a, __constrange(1,32) int b); // VSHR.S32 d0,d0,#32
int64x1_t vshr_n_s64(int64x1_t a, __constrange(1,64) int b); // VSHR.S64 d0,d0,#64
uint8x8_t vshr_n_u8(uint8x8_t a, __constrange(1,8) int b); // VSHR.U8 d0,d0,#8
uint16x4_t vshr_n_u16(uint16x4_t a, __constrange(1,16) int b); // VSHR.U16 d0,d0,#16
uint32x2_t vshr_n_u32(uint32x2_t a, __constrange(1,32) int b); // VSHR.U32 d0,d0,#32
uint64x1_t vshr_n_u64(uint64x1_t a, __constrange(1,64) int b); // VSHR.U64 d0,d0,#64
int8x16_t vshrq_n_s8(int8x16_t a, __constrange(1,8) int b); // VSHR.S8 q0,q0,#8
int16x8_t vshrq_n_s16(int16x8_t a, __constrange(1,16) int b); // VSHR.S16 q0,q0,#16
int32x4_t vshrq_n_s32(int32x4_t a, __constrange(1,32) int b); // VSHR.S32 q0,q0,#32
int64x2_t vshrq_n_s64(int64x2_t a, __constrange(1,64) int b); // VSHR.S64 q0,q0,#64
uint8x16_t vshrq_n_u8(uint8x16_t a, __constrange(1,8) int b); // VSHR.U8 q0,q0,#8
uint16x8_t vshrq_n_u16(uint16x8_t a, __constrange(1,16) int b); // VSHR.U16 q0,q0,#16
uint32x4_t vshrq_n_u32(uint32x4_t a, __constrange(1,32) int b); // VSHR.U32 q0,q0,#32
uint64x2_t vshrq_n_u64(uint64x2_t a, __constrange(1,64) int b); // VSHR.U64 q0,q0,#64
//Vector shift left by constant
int8x8_t vshl_n_s8(int8x8_t a, __constrange(0,7) int b); // VSHL.I8 d0,d0,#0
int16x4_t vshl_n_s16(int16x4_t a, __constrange(0,15) int b); // VSHL.I16 d0,d0,#0
int32x2_t vshl_n_s32(int32x2_t a, __constrange(0,31) int b); // VSHL.I32 d0,d0,#0
int64x1_t vshl_n_s64(int64x1_t a, __constrange(0,63) int b); // VSHL.I64 d0,d0,#0
uint8x8_t vshl_n_u8(uint8x8_t a, __constrange(0,7) int b); // VSHL.I8 d0,d0,#0
uint16x4_t vshl_n_u16(uint16x4_t a, __constrange(0,15) int b); // VSHL.I16 d0,d0,#0
uint32x2_t vshl_n_u32(uint32x2_t a, __constrange(0,31) int b); // VSHL.I32 d0,d0,#0
uint64x1_t vshl_n_u64(uint64x1_t a, __constrange(0,63) int b); // VSHL.I64 d0,d0,#0
int8x16_t vshlq_n_s8(int8x16_t a, __constrange(0,7) int b); // VSHL.I8 q0,q0,#0
int16x8_t vshlq_n_s16(int16x8_t a, __constrange(0,15) int b); // VSHL.I16 q0,q0,#0
int32x4_t vshlq_n_s32(int32x4_t a, __constrange(0,31) int b); // VSHL.I32 q0,q0,#0
int64x2_t vshlq_n_s64(int64x2_t a, __constrange(0,63) int b); // VSHL.I64 q0,q0,#0
uint8x16_t vshlq_n_u8(uint8x16_t a, __constrange(0,7) int b); // VSHL.I8 q0,q0,#0
uint16x8_t vshlq_n_u16(uint16x8_t a, __constrange(0,15) int b); // VSHL.I16 q0,q0,#0
uint32x4_t vshlq_n_u32(uint32x4_t a, __constrange(0,31) int b); // VSHL.I32 q0,q0,#0
uint64x2_t vshlq_n_u64(uint64x2_t a, __constrange(0,63) int b); // VSHL.I64 q0,q0,#0
//Vector rounding shift right by constant
int8x8_t vrshr_n_s8(int8x8_t a, __constrange(1,8) int b); // VRSHR.S8 d0,d0,#8
int16x4_t vrshr_n_s16(int16x4_t a, __constrange(1,16) int b); // VRSHR.S16 d0,d0,#16
int32x2_t vrshr_n_s32(int32x2_t a, __constrange(1,32) int b); // VRSHR.S32 d0,d0,#32
int64x1_t vrshr_n_s64(int64x1_t a, __constrange(1,64) int b); // VRSHR.S64 d0,d0,#64
uint8x8_t vrshr_n_u8(uint8x8_t a, __constrange(1,8) int b); // VRSHR.U8 d0,d0,#8
uint16x4_t vrshr_n_u16(uint16x4_t a, __constrange(1,16) int b); // VRSHR.U16 d0,d0,#16
uint32x2_t vrshr_n_u32(uint32x2_t a, __constrange(1,32) int b); // VRSHR.U32 d0,d0,#32
uint64x1_t vrshr_n_u64(uint64x1_t a, __constrange(1,64) int b); // VRSHR.U64 d0,d0,#64
int8x16_t vrshrq_n_s8(int8x16_t a, __constrange(1,8) int b); // VRSHR.S8 q0,q0,#8
int16x8_t vrshrq_n_s16(int16x8_t a, __constrange(1,16) int b); // VRSHR.S16 q0,q0,#16
int32x4_t vrshrq_n_s32(int32x4_t a, __constrange(1,32) int b); // VRSHR.S32 q0,q0,#32
int64x2_t vrshrq_n_s64(int64x2_t a, __constrange(1,64) int b); // VRSHR.S64 q0,q0,#64
uint8x16_t vrshrq_n_u8(uint8x16_t a, __constrange(1,8) int b); // VRSHR.U8 q0,q0,#8
uint16x8_t vrshrq_n_u16(uint16x8_t a, __constrange(1,16) int b); // VRSHR.U16 q0,q0,#16
uint32x4_t vrshrq_n_u32(uint32x4_t a, __constrange(1,32) int b); // VRSHR.U32 q0,q0,#32
uint64x2_t vrshrq_n_u64(uint64x2_t a, __constrange(1,64) int b); // VRSHR.U64 q0,q0,#64
//Vector shift right by constant and accumulate
int8x8_t vsra_n_s8(int8x8_t a, int8x8_t b, __constrange(1,8) int c); // VSRA.S8 d0,d0,#8
int16x4_t vsra_n_s16(int16x4_t a, int16x4_t b, __constrange(1,16) int c); // VSRA.S16 d0,d0,#16
int32x2_t vsra_n_s32(int32x2_t a, int32x2_t b, __constrange(1,32) int c); // VSRA.S32 d0,d0,#32
int64x1_t vsra_n_s64(int64x1_t a, int64x1_t b, __constrange(1,64) int c); // VSRA.S64 d0,d0,#64
uint8x8_t vsra_n_u8(uint8x8_t a, uint8x8_t b, __constrange(1,8) int c); // VSRA.U8 d0,d0,#8
uint16x4_t vsra_n_u16(uint16x4_t a, uint16x4_t b, __constrange(1,16) int c); // VSRA.U16 d0,d0,#16
uint32x2_t vsra_n_u32(uint32x2_t a, uint32x2_t b, __constrange(1,32) int c); // VSRA.U32 d0,d0,#32
uint64x1_t vsra_n_u64(uint64x1_t a, uint64x1_t b, __constrange(1,64) int c); // VSRA.U64 d0,d0,#64
int8x16_t vsraq_n_s8(int8x16_t a, int8x16_t b, __constrange(1,8) int c); // VSRA.S8 q0,q0,#8
int16x8_t vsraq_n_s16(int16x8_t a, int16x8_t b, __constrange(1,16) int c); // VSRA.S16 q0,q0,#16
int32x4_t vsraq_n_s32(int32x4_t a, int32x4_t b, __constrange(1,32) int c); // VSRA.S32 q0,q0,#32
int64x2_t vsraq_n_s64(int64x2_t a, int64x2_t b, __constrange(1,64) int c); // VSRA.S64 q0,q0,#64
uint8x16_t vsraq_n_u8(uint8x16_t a, uint8x16_t b, __constrange(1,8) int c); // VSRA.U8 q0,q0,#8
uint16x8_t vsraq_n_u16(uint16x8_t a, uint16x8_t b, __constrange(1,16) int c); // VSRA.U16 q0,q0,#16
uint32x4_t vsraq_n_u32(uint32x4_t a, uint32x4_t b, __constrange(1,32) int c); // VSRA.U32 q0,q0,#32
uint64x2_t vsraq_n_u64(uint64x2_t a, uint64x2_t b, __constrange(1,64) int c); // VSRA.U64 q0,q0,#64
//Vector rounding shift right by constant and accumulate
int8x8_t vrsra_n_s8(int8x8_t a, int8x8_t b, __constrange(1,8) int c); // VRSRA.S8 d0,d0,#8
int16x4_t vrsra_n_s16(int16x4_t a, int16x4_t b, __constrange(1,16) int c); // VRSRA.S16 d0,d0,#16
int32x2_t vrsra_n_s32(int32x2_t a, int32x2_t b, __constrange(1,32) int c); // VRSRA.S32 d0,d0,#32
int64x1_t vrsra_n_s64(int64x1_t a, int64x1_t b, __constrange(1,64) int c); // VRSRA.S64 d0,d0,#64
uint8x8_t vrsra_n_u8(uint8x8_t a, uint8x8_t b, __constrange(1,8) int c); // VRSRA.U8 d0,d0,#8
uint16x4_t vrsra_n_u16(uint16x4_t a, uint16x4_t b, __constrange(1,16) int c); // VRSRA.U16 d0,d0,#16
uint32x2_t vrsra_n_u32(uint32x2_t a, uint32x2_t b, __constrange(1,32) int c); // VRSRA.U32 d0,d0,#32
uint64x1_t vrsra_n_u64(uint64x1_t a, uint64x1_t b, __constrange(1,64) int c); // VRSRA.U64 d0,d0,#64
int8x16_t vrsraq_n_s8(int8x16_t a, int8x16_t b, __constrange(1,8) int c); // VRSRA.S8 q0,q0,#8
int16x8_t vrsraq_n_s16(int16x8_t a, int16x8_t b, __constrange(1,16) int c); // VRSRA.S16 q0,q0,#16
int32x4_t vrsraq_n_s32(int32x4_t a, int32x4_t b, __constrange(1,32) int c); // VRSRA.S32 q0,q0,#32
int64x2_t vrsraq_n_s64(int64x2_t a, int64x2_t b, __constrange(1,64) int c); // VRSRA.S64 q0,q0,#64
uint8x16_t vrsraq_n_u8(uint8x16_t a, uint8x16_t b, __constrange(1,8) int c); // VRSRA.U8 q0,q0,#8
uint16x8_t vrsraq_n_u16(uint16x8_t a, uint16x8_t b, __constrange(1,16) int c); // VRSRA.U16 q0,q0,#16
uint32x4_t vrsraq_n_u32(uint32x4_t a, uint32x4_t b, __constrange(1,32) int c); // VRSRA.U32 q0,q0,#32
uint64x2_t vrsraq_n_u64(uint64x2_t a, uint64x2_t b, __constrange(1,64) int c); // VRSRA.U64 q0,q0,#64
//Vector saturating shift left by constant
int8x8_t vqshl_n_s8(int8x8_t a, __constrange(0,7) int b); // VQSHL.S8 d0,d0,#0
int16x4_t vqshl_n_s16(int16x4_t a, __constrange(0,15) int b); // VQSHL.S16 d0,d0,#0
int32x2_t vqshl_n_s32(int32x2_t a, __constrange(0,31) int b); // VQSHL.S32 d0,d0,#0
int64x1_t vqshl_n_s64(int64x1_t a, __constrange(0,63) int b); // VQSHL.S64 d0,d0,#0
uint8x8_t vqshl_n_u8(uint8x8_t a, __constrange(0,7) int b); // VQSHL.U8 d0,d0,#0
uint16x4_t vqshl_n_u16(uint16x4_t a, __constrange(0,15) int b); // VQSHL.U16 d0,d0,#0
uint32x2_t vqshl_n_u32(uint32x2_t a, __constrange(0,31) int b); // VQSHL.U32 d0,d0,#0
uint64x1_t vqshl_n_u64(uint64x1_t a, __constrange(0,63) int b); // VQSHL.U64 d0,d0,#0
int8x16_t vqshlq_n_s8(int8x16_t a, __constrange(0,7) int b); // VQSHL.S8 q0,q0,#0
int16x8_t vqshlq_n_s16(int16x8_t a, __constrange(0,15) int b); // VQSHL.S16 q0,q0,#0
int32x4_t vqshlq_n_s32(int32x4_t a, __constrange(0,31) int b); // VQSHL.S32 q0,q0,#0
int64x2_t vqshlq_n_s64(int64x2_t a, __constrange(0,63) int b); // VQSHL.S64 q0,q0,#0
uint8x16_t vqshlq_n_u8(uint8x16_t a, __constrange(0,7) int b); // VQSHL.U8 q0,q0,#0
uint16x8_t vqshlq_n_u16(uint16x8_t a, __constrange(0,15) int b); // VQSHL.U16 q0,q0,#0
uint32x4_t vqshlq_n_u32(uint32x4_t a, __constrange(0,31) int b); // VQSHL.U32 q0,q0,#0
uint64x2_t vqshlq_n_u64(uint64x2_t a, __constrange(0,63) int b); // VQSHL.U64 q0,q0,#0
//Vector signed->unsigned saturating shift left by constant
uint8x8_t vqshlu_n_s8(int8x8_t a, __constrange(0,7) int b); // VQSHLU.S8 d0,d0,#0
uint16x4_t vqshlu_n_s16(int16x4_t a, __constrange(0,15) int b); // VQSHLU.S16 d0,d0,#0
uint32x2_t vqshlu_n_s32(int32x2_t a, __constrange(0,31) int b); // VQSHLU.S32 d0,d0,#0
uint64x1_t vqshlu_n_s64(int64x1_t a, __constrange(0,63) int b); // VQSHLU.S64 d0,d0,#0
uint8x16_t vqshluq_n_s8(int8x16_t a, __constrange(0,7) int b); // VQSHLU.S8 q0,q0,#0
uint16x8_t vqshluq_n_s16(int16x8_t a, __constrange(0,15) int b); // VQSHLU.S16 q0,q0,#0
uint32x4_t vqshluq_n_s32(int32x4_t a, __constrange(0,31) int b); // VQSHLU.S32 q0,q0,#0
uint64x2_t vqshluq_n_s64(int64x2_t a, __constrange(0,63) int b); // VQSHLU.S64 q0,q0,#0
//Vector narrowing shift right by constant
int8x8_t vshrn_n_s16(int16x8_t a, __constrange(1,8) int b); // VSHRN.I16 d0,q0,#8
int16x4_t vshrn_n_s32(int32x4_t a, __constrange(1,16) int b); // VSHRN.I32 d0,q0,#16
int32x2_t vshrn_n_s64(int64x2_t a, __constrange(1,32) int b); // VSHRN.I64 d0,q0,#32
uint8x8_t vshrn_n_u16(uint16x8_t a, __constrange(1,8) int b); // VSHRN.I16 d0,q0,#8
uint16x4_t vshrn_n_u32(uint32x4_t a, __constrange(1,16) int b); // VSHRN.I32 d0,q0,#16
uint32x2_t vshrn_n_u64(uint64x2_t a, __constrange(1,32) int b); // VSHRN.I64 d0,q0,#32
//Vector signed->unsigned narrowing saturating shift right by constant
uint8x8_t vqshrun_n_s16(int16x8_t a, __constrange(1,8) int b); // VQSHRUN.S16 d0,q0,#8
uint16x4_t vqshrun_n_s32(int32x4_t a, __constrange(1,16) int b); // VQSHRUN.S32 d0,q0,#16
uint32x2_t vqshrun_n_s64(int64x2_t a, __constrange(1,32) int b); // VQSHRUN.S64 d0,q0,#32
//Vector signed->unsigned rounding narrowing saturating shift right by constant
uint8x8_t vqrshrun_n_s16(int16x8_t a, __constrange(1,8) int b); // VQRSHRUN.S16 d0,q0,#8
uint16x4_t vqrshrun_n_s32(int32x4_t a, __constrange(1,16) int b); // VQRSHRUN.S32 d0,q0,#16
uint32x2_t vqrshrun_n_s64(int64x2_t a, __constrange(1,32) int b); // VQRSHRUN.S64 d0,q0,#32
//Vector narrowing saturating shift right by constant
int8x8_t vqshrn_n_s16(int16x8_t a, __constrange(1,8) int b); // VQSHRN.S16 d0,q0,#8
int16x4_t vqshrn_n_s32(int32x4_t a, __constrange(1,16) int b); // VQSHRN.S32 d0,q0,#16
int32x2_t vqshrn_n_s64(int64x2_t a, __constrange(1,32) int b); // VQSHRN.S64 d0,q0,#32
uint8x8_t vqshrn_n_u16(uint16x8_t a, __constrange(1,8) int b); // VQSHRN.U16 d0,q0,#8
uint16x4_t vqshrn_n_u32(uint32x4_t a, __constrange(1,16) int b); // VQSHRN.U32 d0,q0,#16
uint32x2_t vqshrn_n_u64(uint64x2_t a, __constrange(1,32) int b); // VQSHRN.U64 d0,q0,#32
//Vector rounding narrowing shift right by constant
int8x8_t vrshrn_n_s16(int16x8_t a, __constrange(1,8) int b); // VRSHRN.I16 d0,q0,#8
int16x4_t vrshrn_n_s32(int32x4_t a, __constrange(1,16) int b); // VRSHRN.I32 d0,q0,#16
int32x2_t vrshrn_n_s64(int64x2_t a, __constrange(1,32) int b); // VRSHRN.I64 d0,q0,#32
uint8x8_t vrshrn_n_u16(uint16x8_t a, __constrange(1,8) int b); // VRSHRN.I16 d0,q0,#8
uint16x4_t vrshrn_n_u32(uint32x4_t a, __constrange(1,16) int b); // VRSHRN.I32 d0,q0,#16
uint32x2_t vrshrn_n_u64(uint64x2_t a, __constrange(1,32) int b); // VRSHRN.I64 d0,q0,#32
//Vector rounding narrowing saturating shift right by constant
int8x8_t vqrshrn_n_s16(int16x8_t a, __constrange(1,8) int b); // VQRSHRN.S16 d0,q0,#8
int16x4_t vqrshrn_n_s32(int32x4_t a, __constrange(1,16) int b); // VQRSHRN.S32 d0,q0,#16
int32x2_t vqrshrn_n_s64(int64x2_t a, __constrange(1,32) int b); // VQRSHRN.S64 d0,q0,#32
uint8x8_t vqrshrn_n_u16(uint16x8_t a, __constrange(1,8) int b); // VQRSHRN.U16 d0,q0,#8
uint16x4_t vqrshrn_n_u32(uint32x4_t a, __constrange(1,16) int b); // VQRSHRN.U32 d0,q0,#16
uint32x2_t vqrshrn_n_u64(uint64x2_t a, __constrange(1,32) int b); // VQRSHRN.U64 d0,q0,#32
//Vector widening shift left by constant
int16x8_t vshll_n_s8(int8x8_t a, __constrange(0,8) int b); // VSHLL.S8 q0,d0,#0
int32x4_t vshll_n_s16(int16x4_t a, __constrange(0,16) int b); // VSHLL.S16 q0,d0,#0
int64x2_t vshll_n_s32(int32x2_t a, __constrange(0,32) int b); // VSHLL.S32 q0,d0,#0
uint16x8_t vshll_n_u8(uint8x8_t a, __constrange(0,8) int b); // VSHLL.U8 q0,d0,#0
uint32x4_t vshll_n_u16(uint16x4_t a, __constrange(0,16) int b); // VSHLL.U16 q0,d0,#0
uint64x2_t vshll_n_u32(uint32x2_t a, __constrange(0,32) int b); // VSHLL.U32 q0,d0,#0
//Shifts with insert
//Vector shift right and insert
int8x8_t vsri_n_s8(int8x8_t a, int8x8_t b, __constrange(1,8) int c); // VSRI.8 d0,d0,#8
int16x4_t vsri_n_s16(int16x4_t a, int16x4_t b, __constrange(1,16) int c); // VSRI.16 d0,d0,#16
int32x2_t vsri_n_s32(int32x2_t a, int32x2_t b, __constrange(1,32) int c); // VSRI.32 d0,d0,#32
int64x1_t vsri_n_s64(int64x1_t a, int64x1_t b, __constrange(1,64) int c); // VSRI.64 d0,d0,#64
uint8x8_t vsri_n_u8(uint8x8_t a, uint8x8_t b, __constrange(1,8) int c); // VSRI.8 d0,d0,#8
uint16x4_t vsri_n_u16(uint16x4_t a, uint16x4_t b, __constrange(1,16) int c); // VSRI.16 d0,d0,#16
uint32x2_t vsri_n_u32(uint32x2_t a, uint32x2_t b, __constrange(1,32) int c); // VSRI.32 d0,d0,#32
uint64x1_t vsri_n_u64(uint64x1_t a, uint64x1_t b, __constrange(1,64) int c); // VSRI.64 d0,d0,#64
poly8x8_t vsri_n_p8(poly8x8_t a, poly8x8_t b, __constrange(1,8) int c); // VSRI.8 d0,d0,#8
poly16x4_t vsri_n_p16(poly16x4_t a, poly16x4_t b, __constrange(1,16) int c); // VSRI.16 d0,d0,#16
int8x16_t vsriq_n_s8(int8x16_t a, int8x16_t b, __constrange(1,8) int c); // VSRI.8 q0,q0,#8
int16x8_t vsriq_n_s16(int16x8_t a, int16x8_t b, __constrange(1,16) int c); // VSRI.16 q0,q0,#16
int32x4_t vsriq_n_s32(int32x4_t a, int32x4_t b, __constrange(1,32) int c); // VSRI.32 q0,q0,#32
int64x2_t vsriq_n_s64(int64x2_t a, int64x2_t b, __constrange(1,64) int c); // VSRI.64 q0,q0,#64
uint8x16_t vsriq_n_u8(uint8x16_t a, uint8x16_t b, __constrange(1,8) int c); // VSRI.8 q0,q0,#8
uint16x8_t vsriq_n_u16(uint16x8_t a, uint16x8_t b, __constrange(1,16) int c); // VSRI.16 q0,q0,#16
uint32x4_t vsriq_n_u32(uint32x4_t a, uint32x4_t b, __constrange(1,32) int c); // VSRI.32 q0,q0,#32
uint64x2_t vsriq_n_u64(uint64x2_t a, uint64x2_t b, __constrange(1,64) int c); // VSRI.64 q0,q0,#64
poly8x16_t vsriq_n_p8(poly8x16_t a, poly8x16_t b, __constrange(1,8) int c); // VSRI.8 q0,q0,#8
poly16x8_t vsriq_n_p16(poly16x8_t a, poly16x8_t b, __constrange(1,16) int c); // VSRI.16 q0,q0,#16
//Vector shift left and insert
int8x8_t vsli_n_s8(int8x8_t a, int8x8_t b, __constrange(0,7) int c); // VSLI.8 d0,d0,#0
int16x4_t vsli_n_s16(int16x4_t a, int16x4_t b, __constrange(0,15) int c); // VSLI.16 d0,d0,#0
int32x2_t vsli_n_s32(int32x2_t a, int32x2_t b, __constrange(0,31) int c); // VSLI.32 d0,d0,#0
int64x1_t vsli_n_s64(int64x1_t a, int64x1_t b, __constrange(0,63) int c); // VSLI.64 d0,d0,#0
uint8x8_t vsli_n_u8(uint8x8_t a, uint8x8_t b, __constrange(0,7) int c); // VSLI.8 d0,d0,#0
uint16x4_t vsli_n_u16(uint16x4_t a, uint16x4_t b, __constrange(0,15) int c); // VSLI.16 d0,d0,#0
uint32x2_t vsli_n_u32(uint32x2_t a, uint32x2_t b, __constrange(0,31) int c); // VSLI.32 d0,d0,#0
uint64x1_t vsli_n_u64(uint64x1_t a, uint64x1_t b, __constrange(0,63) int c); // VSLI.64 d0,d0,#0
poly8x8_t vsli_n_p8(poly8x8_t a, poly8x8_t b, __constrange(0,7) int c); // VSLI.8 d0,d0,#0
poly16x4_t vsli_n_p16(poly16x4_t a, poly16x4_t b, __constrange(0,15) int c); // VSLI.16 d0,d0,#0
int8x16_t vsliq_n_s8(int8x16_t a, int8x16_t b, __constrange(0,7) int c); // VSLI.8 q0,q0,#0
int16x8_t vsliq_n_s16(int16x8_t a, int16x8_t b, __constrange(0,15) int c); // VSLI.16 q0,q0,#0
int32x4_t vsliq_n_s32(int32x4_t a, int32x4_t b, __constrange(0,31) int c); // VSLI.32 q0,q0,#0
int64x2_t vsliq_n_s64(int64x2_t a, int64x2_t b, __constrange(0,63) int c); // VSLI.64 q0,q0,#0
uint8x16_t vsliq_n_u8(uint8x16_t a, uint8x16_t b, __constrange(0,7) int c); // VSLI.8 q0,q0,#0
uint16x8_t vsliq_n_u16(uint16x8_t a, uint16x8_t b, __constrange(0,15) int c); // VSLI.16 q0,q0,#0
uint32x4_t vsliq_n_u32(uint32x4_t a, uint32x4_t b, __constrange(0,31) int c); // VSLI.32 q0,q0,#0
uint64x2_t vsliq_n_u64(uint64x2_t a, uint64x2_t b, __constrange(0,63) int c); // VSLI.64 q0,q0,#0
poly8x16_t vsliq_n_p8(poly8x16_t a, poly8x16_t b, __constrange(0,7) int c); // VSLI.8 q0,q0,#0
poly16x8_t vsliq_n_p16(poly16x8_t a, poly16x8_t b, __constrange(0,15) int c); // VSLI.16 q0,q0,#0
//Loads of a single vector or lane. Perform loads and stores of a single vector of some type.
//Load a single vector from memory
uint8x16_t vld1q_u8(__transfersize(16) uint8_t const * ptr); // VLD1.8 {d0, d1}, [r0]
uint16x8_t vld1q_u16(__transfersize(8) uint16_t const * ptr); // VLD1.16 {d0, d1}, [r0]
uint32x4_t vld1q_u32(__transfersize(4) uint32_t const * ptr); // VLD1.32 {d0, d1}, [r0]
uint64x2_t vld1q_u64(__transfersize(2) uint64_t const * ptr); // VLD1.64 {d0, d1}, [r0]
int8x16_t vld1q_s8(__transfersize(16) int8_t const * ptr); // VLD1.8 {d0, d1}, [r0]
int16x8_t vld1q_s16(__transfersize(8) int16_t const * ptr); // VLD1.16 {d0, d1}, [r0]
int32x4_t vld1q_s32(__transfersize(4) int32_t const * ptr); // VLD1.32 {d0, d1}, [r0]
int64x2_t vld1q_s64(__transfersize(2) int64_t const * ptr); // VLD1.64 {d0, d1}, [r0]
float16x8_t vld1q_f16(__transfersize(8) __fp16 const * ptr); // VLD1.16 {d0, d1}, [r0]
float32x4_t vld1q_f32(__transfersize(4) float32_t const * ptr); // VLD1.32 {d0, d1}, [r0]
poly8x16_t vld1q_p8(__transfersize(16) poly8_t const * ptr); // VLD1.8 {d0, d1}, [r0]
poly16x8_t vld1q_p16(__transfersize(8) poly16_t const * ptr); // VLD1.16 {d0, d1}, [r0]
uint8x8_t vld1_u8(__transfersize(8) uint8_t const * ptr); // VLD1.8 {d0}, [r0]
uint16x4_t vld1_u16(__transfersize(4) uint16_t const * ptr); // VLD1.16 {d0}, [r0]
uint32x2_t vld1_u32(__transfersize(2) uint32_t const * ptr); // VLD1.32 {d0}, [r0]
uint64x1_t vld1_u64(__transfersize(1) uint64_t const * ptr); // VLD1.64 {d0}, [r0]
int8x8_t vld1_s8(__transfersize(8) int8_t const * ptr); // VLD1.8 {d0}, [r0]
int16x4_t vld1_s16(__transfersize(4) int16_t const * ptr); // VLD1.16 {d0}, [r0]
int32x2_t vld1_s32(__transfersize(2) int32_t const * ptr); // VLD1.32 {d0}, [r0]
int64x1_t vld1_s64(__transfersize(1) int64_t const * ptr); // VLD1.64 {d0}, [r0]
float16x4_t vld1_f16(__transfersize(4) __fp16 const * ptr); // VLD1.16 {d0}, [r0]
float32x2_t vld1_f32(__transfersize(2) float32_t const * ptr); // VLD1.32 {d0}, [r0]
poly8x8_t vld1_p8(__transfersize(8) poly8_t const * ptr); // VLD1.8 {d0}, [r0]
poly16x4_t vld1_p16(__transfersize(4) poly16_t const * ptr); // VLD1.16 {d0}, [r0]
//Load a single lane from memory
uint8x16_t vld1q_lane_u8(__transfersize(1) uint8_t const * ptr, uint8x16_t vec, __constrange(0,15) int lane); //VLD1.8 {d0[0]}, [r0]
uint16x8_t vld1q_lane_u16(__transfersize(1) uint16_t const * ptr, uint16x8_t vec, __constrange(0,7) int lane); // VLD1.16 {d0[0]}, [r0]
uint32x4_t vld1q_lane_u32(__transfersize(1) uint32_t const * ptr, uint32x4_t vec, __constrange(0,3) int lane); // VLD1.32 {d0[0]}, [r0]
uint64x2_t vld1q_lane_u64(__transfersize(1) uint64_t const * ptr, uint64x2_t vec, __constrange(0,1) int lane); // VLD1.64 {d0}, [r0]
int8x16_t vld1q_lane_s8(__transfersize(1) int8_t const * ptr, int8x16_t vec, __constrange(0,15) int lane); //VLD1.8 {d0[0]}, [r0]
int16x8_t vld1q_lane_s16(__transfersize(1) int16_t const * ptr, int16x8_t vec, __constrange(0,7) int lane); //VLD1.16 {d0[0]}, [r0]
int32x4_t vld1q_lane_s32(__transfersize(1) int32_t const * ptr, int32x4_t vec, __constrange(0,3) int lane); //VLD1.32 {d0[0]}, [r0]
float16x8_t vld1q_lane_f16(__transfersize(1) __fp16 const * ptr, float16x8_t vec, __constrange(0,7) int lane); //VLD1.16 {d0[0]}, [r0]
float32x4_t vld1q_lane_f32(__transfersize(1) float32_t const * ptr, float32x4_t vec, __constrange(0,3) int lane); // VLD1.32 {d0[0]}, [r0]
int64x2_t vld1q_lane_s64(__transfersize(1) int64_t const * ptr, int64x2_t vec, __constrange(0,1) int lane); //VLD1.64 {d0}, [r0]
poly8x16_t vld1q_lane_p8(__transfersize(1) poly8_t const * ptr, poly8x16_t vec, __constrange(0,15) int lane); //VLD1.8 {d0[0]}, [r0]
poly16x8_t vld1q_lane_p16(__transfersize(1) poly16_t const * ptr, poly16x8_t vec, __constrange(0,7) int lane); // VLD1.16 {d0[0]}, [r0]
uint8x8_t vld1_lane_u8(__transfersize(1) uint8_t const * ptr, uint8x8_t vec, __constrange(0,7) int lane); //VLD1.8 {d0[0]}, [r0]
uint16x4_t vld1_lane_u16(__transfersize(1) uint16_t const * ptr, uint16x4_t vec, __constrange(0,3) int lane); //VLD1.16 {d0[0]}, [r0]
uint32x2_t vld1_lane_u32(__transfersize(1) uint32_t const * ptr, uint32x2_t vec, __constrange(0,1) int lane); //VLD1.32 {d0[0]}, [r0]
uint64x1_t vld1_lane_u64(__transfersize(1) uint64_t const * ptr, uint64x1_t vec, __constrange(0,0) int lane); //VLD1.64 {d0}, [r0]
int8x8_t vld1_lane_s8(__transfersize(1) int8_t const * ptr, int8x8_t vec, __constrange(0,7) int lane); // VLD1.8{d0[0]}, [r0]
int16x4_t vld1_lane_s16(__transfersize(1) int16_t const * ptr, int16x4_t vec, __constrange(0,3) int lane); //VLD1.16 {d0[0]}, [r0]
int32x2_t vld1_lane_s32(__transfersize(1) int32_t const * ptr, int32x2_t vec, __constrange(0,1) int lane); //VLD1.32 {d0[0]}, [r0]
float16x4_t vld1q_lane_f16(__transfersize(1) __fp16 const * ptr, float16x4_t vec, __constrange(0,3) int lane); //VLD1.16 {d0[0]}, [r0]
float32x2_t vld1_lane_f32(__transfersize(1) float32_t const * ptr, float32x2_t vec, __constrange(0,1) int lane); // VLD1.32 {d0[0]}, [r0]
int64x1_t vld1_lane_s64(__transfersize(1) int64_t const * ptr, int64x1_t vec, __constrange(0,0) int lane); //VLD1.64 {d0}, [r0]
poly8x8_t vld1_lane_p8(__transfersize(1) poly8_t const * ptr, poly8x8_t vec, __constrange(0,7) int lane); //VLD1.8 {d0[0]}, [r0]
poly16x4_t vld1_lane_p16(__transfersize(1) poly16_t const * ptr, poly16x4_t vec, __constrange(0,3) int lane); //VLD1.16 {d0[0]}, [r0]
//Load all lanes of vector with same value from memory
uint8x16_t vld1q_dup_u8(__transfersize(1) uint8_t const * ptr); // VLD1.8 {d0[]}, [r0]
uint16x8_t vld1q_dup_u16(__transfersize(1) uint16_t const * ptr); // VLD1.16 {d0[]}, [r0]
uint32x4_t vld1q_dup_u32(__transfersize(1) uint32_t const * ptr); // VLD1.32 {d0[]}, [r0]
uint64x2_t vld1q_dup_u64(__transfersize(1) uint64_t const * ptr); // VLD1.64 {d0}, [r0]
int8x16_t vld1q_dup_s8(__transfersize(1) int8_t const * ptr); // VLD1.8 {d0[]}, [r0]
int16x8_t vld1q_dup_s16(__transfersize(1) int16_t const * ptr); // VLD1.16 {d0[]}, [r0]
int32x4_t vld1q_dup_s32(__transfersize(1) int32_t const * ptr); // VLD1.32 {d0[]}, [r0]
int64x2_t vld1q_dup_s64(__transfersize(1) int64_t const * ptr); // VLD1.64 {d0}, [r0]
float16x8_t vld1q_dup_f16(__transfersize(1) __fp16 const * ptr); // VLD1.16 {d0[]}, [r0]
float32x4_t vld1q_dup_f32(__transfersize(1) float32_t const * ptr); // VLD1.32 {d0[]}, [r0]
poly8x16_t vld1q_dup_p8(__transfersize(1) poly8_t const * ptr); // VLD1.8 {d0[]}, [r0]
poly16x8_t vld1q_dup_p16(__transfersize(1) poly16_t const * ptr); // VLD1.16 {d0[]}, [r0]
uint8x8_t vld1_dup_u8(__transfersize(1) uint8_t const * ptr); // VLD1.8 {d0[]}, [r0]
uint16x4_t vld1_dup_u16(__transfersize(1) uint16_t const * ptr); // VLD1.16 {d0[]}, [r0]
uint32x2_t vld1_dup_u32(__transfersize(1) uint32_t const * ptr); // VLD1.32 {d0[]}, [r0]
uint64x1_t vld1_dup_u64(__transfersize(1) uint64_t const * ptr); // VLD1.64 {d0}, [r0]
int8x8_t vld1_dup_s8(__transfersize(1) int8_t const * ptr); // VLD1.8 {d0[]}, [r0]
int16x4_t vld1_dup_s16(__transfersize(1) int16_t const * ptr); // VLD1.16 {d0[]}, [r0]
int32x2_t vld1_dup_s32(__transfersize(1) int32_t const * ptr); // VLD1.32 {d0[]}, [r0]
int64x1_t vld1_dup_s64(__transfersize(1) int64_t const * ptr); // VLD1.64 {d0}, [r0]
float16x4_t vld1_dup_f16(__transfersize(1) __fp16 const * ptr); // VLD1.16 {d0[]}, [r0]
float32x2_t vld1_dup_f32(__transfersize(1) float32_t const * ptr); // VLD1.32 {d0[]}, [r0]
poly8x8_t vld1_dup_p8(__transfersize(1) poly8_t const * ptr); // VLD1.8 {d0[]}, [r0]
poly16x4_t vld1_dup_p16(__transfersize(1) poly16_t const * ptr); // VLD1.16 {d0[]}, [r0]
//Store a single vector or lane. Stores all lanes or a single lane of a vector.
//Store a single vector into memory
void vst1q_u8(__transfersize(16) uint8_t * ptr, uint8x16_t val); // VST1.8 {d0, d1}, [r0]
void vst1q_u16(__transfersize(8) uint16_t * ptr, uint16x8_t val); // VST1.16 {d0, d1}, [r0]
void vst1q_u32(__transfersize(4) uint32_t * ptr, uint32x4_t val); // VST1.32 {d0, d1}, [r0]
void vst1q_u64(__transfersize(2) uint64_t * ptr, uint64x2_t val); // VST1.64 {d0, d1}, [r0]
void vst1q_s8(__transfersize(16) int8_t * ptr, int8x16_t val); // VST1.8 {d0, d1}, [r0]
void vst1q_s16(__transfersize(8) int16_t * ptr, int16x8_t val); // VST1.16 {d0, d1}, [r0]
void vst1q_s32(__transfersize(4) int32_t * ptr, int32x4_t val); // VST1.32 {d0, d1}, [r0]
void vst1q_s64(__transfersize(2) int64_t * ptr, int64x2_t val); // VST1.64 {d0, d1}, [r0]
void vst1q_f16(__transfersize(8) __fp16 * ptr, float16x8_t val); // VST1.16 {d0, d1}, [r0]
void vst1q_f32(__transfersize(4) float32_t * ptr, float32x4_t val); // VST1.32 {d0, d1}, [r0]
void vst1q_p8(__transfersize(16) poly8_t * ptr, poly8x16_t val); // VST1.8 {d0, d1}, [r0]
void vst1q_p16(__transfersize(8) poly16_t * ptr, poly16x8_t val); // VST1.16 {d0, d1}, [r0]
void vst1_u8(__transfersize(8) uint8_t * ptr, uint8x8_t val); // VST1.8 {d0}, [r0]
void vst1_u16(__transfersize(4) uint16_t * ptr, uint16x4_t val); // VST1.16 {d0}, [r0]
void vst1_u32(__transfersize(2) uint32_t * ptr, uint32x2_t val); // VST1.32 {d0}, [r0]
void vst1_u64(__transfersize(1) uint64_t * ptr, uint64x1_t val); // VST1.64 {d0}, [r0]
void vst1_s8(__transfersize(8) int8_t * ptr, int8x8_t val); // VST1.8 {d0}, [r0]
void vst1_s16(__transfersize(4) int16_t * ptr, int16x4_t val); // VST1.16 {d0}, [r0]
void vst1_s32(__transfersize(2) int32_t * ptr, int32x2_t val); // VST1.32 {d0}, [r0]
void vst1_s64(__transfersize(1) int64_t * ptr, int64x1_t val); // VST1.64 {d0}, [r0]
void vst1_f16(__transfersize(4) __fp16 * ptr, float16x4_t val); // VST1.16 {d0}, [r0]
void vst1_f32(__transfersize(2) float32_t * ptr, float32x2_t val); // VST1.32 {d0}, [r0]
void vst1_p8(__transfersize(8) poly8_t * ptr, poly8x8_t val); // VST1.8 {d0}, [r0]
void vst1_p16(__transfersize(4) poly16_t * ptr, poly16x4_t val); // VST1.16 {d0}, [r0]
//Store a lane of a vector into memory
//Loads of an N-element structure
//Load N-element structure from memory
uint8x16x2_t vld2q_u8(__transfersize(32) uint8_t const * ptr); // VLD2.8 {d0, d2}, [r0]
uint16x8x2_t vld2q_u16(__transfersize(16) uint16_t const * ptr); // VLD2.16 {d0, d2}, [r0]
uint32x4x2_t vld2q_u32(__transfersize(8) uint32_t const * ptr); // VLD2.32 {d0, d2}, [r0]
int8x16x2_t vld2q_s8(__transfersize(32) int8_t const * ptr); // VLD2.8 {d0, d2}, [r0]
int16x8x2_t vld2q_s16(__transfersize(16) int16_t const * ptr); // VLD2.16 {d0, d2}, [r0]
int32x4x2_t vld2q_s32(__transfersize(8) int32_t const * ptr); // VLD2.32 {d0, d2}, [r0]
float16x8x2_t vld2q_f16(__transfersize(16) __fp16 const * ptr); // VLD2.16 {d0, d2}, [r0]
float32x4x2_t vld2q_f32(__transfersize(8) float32_t const * ptr); // VLD2.32 {d0, d2}, [r0]
poly8x16x2_t vld2q_p8(__transfersize(32) poly8_t const * ptr); // VLD2.8 {d0, d2}, [r0]
poly16x8x2_t vld2q_p16(__transfersize(16) poly16_t const * ptr); // VLD2.16 {d0, d2}, [r0]
uint8x8x2_t vld2_u8(__transfersize(16) uint8_t const * ptr); // VLD2.8 {d0, d1}, [r0]
uint16x4x2_t vld2_u16(__transfersize(8) uint16_t const * ptr); // VLD2.16 {d0, d1}, [r0]
uint32x2x2_t vld2_u32(__transfersize(4) uint32_t const * ptr); // VLD2.32 {d0, d1}, [r0]
uint64x1x2_t vld2_u64(__transfersize(2) uint64_t const * ptr); // VLD1.64 {d0, d1}, [r0]
int8x8x2_t vld2_s8(__transfersize(16) int8_t const * ptr); // VLD2.8 {d0, d1}, [r0]
int16x4x2_t vld2_s16(__transfersize(8) int16_t const * ptr); // VLD2.16 {d0, d1}, [r0]
int32x2x2_t vld2_s32(__transfersize(4) int32_t const * ptr); // VLD2.32 {d0, d1}, [r0]
int64x1x2_t vld2_s64(__transfersize(2) int64_t const * ptr); // VLD1.64 {d0, d1}, [r0]
//float16x4x2_t vld2_f16(__transfersize(8) __fp16 const * ptr); // VLD2.16 {d0, d1}, [r0]
float32x2x2_t vld2_f32(__transfersize(4) float32_t const * ptr); // VLD2.32 {d0, d1}, [r0]
poly8x8x2_t vld2_p8(__transfersize(16) poly8_t const * ptr); // VLD2.8 {d0, d1}, [r0]
poly16x4x2_t vld2_p16(__transfersize(8) poly16_t const * ptr); // VLD2.16 {d0, d1}, [r0]
uint8x16x3_t vld3q_u8(__transfersize(48) uint8_t const * ptr); // VLD3.8 {d0, d2, d4}, [r0]
uint16x8x3_t vld3q_u16(__transfersize(24) uint16_t const * ptr); // VLD3.16 {d0, d2, d4}, [r0]
uint32x4x3_t vld3q_u32(__transfersize(12) uint32_t const * ptr); // VLD3.32 {d0, d2, d4}, [r0]
int8x16x3_t vld3q_s8(__transfersize(48) int8_t const * ptr); // VLD3.8 {d0, d2, d4}, [r0]
int16x8x3_t vld3q_s16(__transfersize(24) int16_t const * ptr); // VLD3.16 {d0, d2, d4}, [r0]
int32x4x3_t vld3q_s32(__transfersize(12) int32_t const * ptr); // VLD3.32 {d0, d2, d4}, [r0]
float16x8x3_t vld3q_f16(__transfersize(24) __fp16 const * ptr); // VLD3.16 {d0, d2, d4}, [r0]
float32x4x3_t vld3q_f32(__transfersize(12) float32_t const * ptr); // VLD3.32 {d0, d2, d4}, [r0]
poly8x16x3_t vld3q_p8(__transfersize(48) poly8_t const * ptr); // VLD3.8 {d0, d2, d4}, [r0]
poly16x8x3_t vld3q_p16(__transfersize(24) poly16_t const * ptr); // VLD3.16 {d0, d2, d4}, [r0]
uint8x8x3_t vld3_u8(__transfersize(24) uint8_t const * ptr); // VLD3.8 {d0, d1, d2}, [r0]
uint16x4x3_t vld3_u16(__transfersize(12) uint16_t const * ptr); // VLD3.16 {d0, d1, d2}, [r0]
uint32x2x3_t vld3_u32(__transfersize(6) uint32_t const * ptr); // VLD3.32 {d0, d1, d2}, [r0]
uint64x1x3_t vld3_u64(__transfersize(3) uint64_t const * ptr); // VLD1.64 {d0, d1, d2}, [r0]
int8x8x3_t vld3_s8(__transfersize(24) int8_t const * ptr); // VLD3.8 {d0, d1, d2}, [r0]
int16x4x3_t vld3_s16(__transfersize(12) int16_t const * ptr); // VLD3.16 {d0, d1, d2}, [r0]
int32x2x3_t vld3_s32(__transfersize(6) int32_t const * ptr); // VLD3.32 {d0, d1, d2}, [r0]
int64x1x3_t vld3_s64(__transfersize(3) int64_t const * ptr); // VLD1.64 {d0, d1, d2}, [r0]
float16x4x3_t vld3_f16(__transfersize(12) __fp16 const * ptr); // VLD3.16 {d0, d1, d2}, [r0]
float32x2x3_t vld3_f32(__transfersize(6) float32_t const * ptr); // VLD3.32 {d0, d1, d2}, [r0]
poly8x8x3_t vld3_p8(__transfersize(24) poly8_t const * ptr); // VLD3.8 {d0, d1, d2}, [r0]
poly16x4x3_t vld3_p16(__transfersize(12) poly16_t const * ptr); // VLD3.16 {d0, d1, d2}, [r0]
uint8x16x4_t vld4q_u8(__transfersize(64) uint8_t const * ptr); // VLD4.8 {d0, d2, d4, d6}, [r0]
uint16x8x4_t vld4q_u16(__transfersize(32) uint16_t const * ptr); // VLD4.16 {d0, d2, d4, d6}, [r0]
uint32x4x4_t vld4q_u32(__transfersize(16) uint32_t const * ptr); // VLD4.32 {d0, d2, d4, d6}, [r0]
int8x16x4_t vld4q_s8(__transfersize(64) int8_t const * ptr); // VLD4.8 {d0, d2, d4, d6}, [r0]
int16x8x4_t vld4q_s16(__transfersize(32) int16_t const * ptr); // VLD4.16 {d0, d2, d4, d6}, [r0]
int32x4x4_t vld4q_s32(__transfersize(16) int32_t const * ptr); // VLD4.32 {d0, d2, d4, d6}, [r0]
float16x8x4_t vld4q_f16(__transfersize(32) __fp16 const * ptr); // VLD4.16 {d0, d2, d4, d6}, [r0]
float32x4x4_t vld4q_f32(__transfersize(16) float32_t const * ptr); // VLD4.32 {d0, d2, d4, d6}, [r0]
poly8x16x4_t vld4q_p8(__transfersize(64) poly8_t const * ptr); // VLD4.8 {d0, d2, d4, d6}, [r0]
poly16x8x4_t vld4q_p16(__transfersize(32) poly16_t const * ptr); // VLD4.16 {d0, d2, d4, d6}, [r0]
uint8x8x4_t vld4_u8(__transfersize(32) uint8_t const * ptr); // VLD4.8 {d0, d1, d2, d3}, [r0]
uint16x4x4_t vld4_u16(__transfersize(16) uint16_t const * ptr); // VLD4.16 {d0, d1, d2, d3}, [r0]
uint32x2x4_t vld4_u32(__transfersize(8) uint32_t const * ptr); // VLD4.32 {d0, d1, d2, d3}, [r0]
uint64x1x4_t vld4_u64(__transfersize(4) uint64_t const * ptr); // VLD1.64 {d0, d1, d2, d3}, [r0]
int8x8x4_t vld4_s8(__transfersize(32) int8_t const * ptr); // VLD4.8 {d0, d1, d2, d3}, [r0]
int16x4x4_t vld4_s16(__transfersize(16) int16_t const * ptr); // VLD4.16 {d0, d1, d2, d3}, [r0]
int32x2x4_t vld4_s32(__transfersize(8) int32_t const * ptr); // VLD4.32 {d0, d1, d2, d3}, [r0]
int64x1x4_t vld4_s64(__transfersize(4) int64_t const * ptr); // VLD1.64 {d0, d1, d2, d3}, [r0]
float16x4x4_t vld4_f16(__transfersize(16) __fp16 const * ptr); // VLD4.16 {d0, d1, d2, d3}, [r0]
float32x2x4_t vld4_f32(__transfersize(8) float32_t const * ptr); // VLD4.32 {d0, d1, d2, d3}, [r0]
poly8x8x4_t vld4_p8(__transfersize(32) poly8_t const * ptr); // VLD4.8 {d0, d1, d2, d3}, [r0]
poly16x4x4_t vld4_p16(__transfersize(16) poly16_t const * ptr); // VLD4.16 {d0, d1, d2, d3}, [r0]
//Load all lanes of N-element structure with same value from memory
uint8x8x2_t vld2_dup_u8(__transfersize(2) uint8_t const * ptr); // VLD2.8 {d0[], d1[]}, [r0]
uint16x4x2_t vld2_dup_u16(__transfersize(2) uint16_t const * ptr); // VLD2.16 {d0[], d1[]}, [r0]
uint32x2x2_t vld2_dup_u32(__transfersize(2) uint32_t const * ptr); // VLD2.32 {d0[], d1[]}, [r0]
uint64x1x2_t vld2_dup_u64(__transfersize(2) uint64_t const * ptr); // VLD1.64 {d0, d1}, [r0]
int8x8x2_t vld2_dup_s8(__transfersize(2) int8_t const * ptr); // VLD2.8 {d0[], d1[]}, [r0]
int16x4x2_t vld2_dup_s16(__transfersize(2) int16_t const * ptr); // VLD2.16 {d0[], d1[]}, [r0]
int32x2x2_t vld2_dup_s32(__transfersize(2) int32_t const * ptr); // VLD2.32 {d0[], d1[]}, [r0]
int64x1x2_t vld2_dup_s64(__transfersize(2) int64_t const * ptr); // VLD1.64 {d0, d1}, [r0]
//float16x4x2_t vld2_dup_f16(__transfersize(2) __fp16 const * ptr); // VLD2.16 {d0[], d1[]}, [r0]
float32x2x2_t vld2_dup_f32(__transfersize(2) float32_t const * ptr); // VLD2.32 {d0[], d1[]}, [r0]
poly8x8x2_t vld2_dup_p8(__transfersize(2) poly8_t const * ptr); // VLD2.8 {d0[], d1[]}, [r0]
poly16x4x2_t vld2_dup_p16(__transfersize(2) poly16_t const * ptr); // VLD2.16 {d0[], d1[]}, [r0]
uint8x8x3_t vld3_dup_u8(__transfersize(3) uint8_t const * ptr); // VLD3.8 {d0[], d1[], d2[]}, [r0]
uint16x4x3_t vld3_dup_u16(__transfersize(3) uint16_t const * ptr); // VLD3.16 {d0[], d1[], d2[]}, [r0]
uint32x2x3_t vld3_dup_u32(__transfersize(3) uint32_t const * ptr); // VLD3.32 {d0[], d1[], d2[]}, [r0]
uint64x1x3_t vld3_dup_u64(__transfersize(3) uint64_t const * ptr); // VLD1.64 {d0, d1, d2}, [r0]
int8x8x3_t vld3_dup_s8(__transfersize(3) int8_t const * ptr); // VLD3.8 {d0[], d1[], d2[]}, [r0]
int16x4x3_t vld3_dup_s16(__transfersize(3) int16_t const * ptr); // VLD3.16 {d0[], d1[], d2[]}, [r0]
int32x2x3_t vld3_dup_s32(__transfersize(3) int32_t const * ptr); // VLD3.32 {d0[], d1[], d2[]}, [r0]
int64x1x3_t vld3_dup_s64(__transfersize(3) int64_t const * ptr); // VLD1.64 {d0, d1, d2}, [r0]
float16x4x3_t vld3_dup_f16(__transfersize(3) __fp16 const * ptr); // VLD3.16 {d0[], d1[], d2[]}, [r0]
float32x2x3_t vld3_dup_f32(__transfersize(3) float32_t const * ptr); // VLD3.32 {d0[], d1[], d2[]}, [r0]
poly8x8x3_t vld3_dup_p8(__transfersize(3) poly8_t const * ptr); // VLD3.8 {d0[], d1[], d2[]}, [r0]
poly16x4x3_t vld3_dup_p16(__transfersize(3) poly16_t const * ptr); // VLD3.16 {d0[], d1[], d2[]}, [r0]
uint8x8x4_t vld4_dup_u8(__transfersize(4) uint8_t const * ptr); // VLD4.8 {d0[], d1[], d2[], d3[]}, [r0]
uint16x4x4_t vld4_dup_u16(__transfersize(4) uint16_t const * ptr); // VLD4.16 {d0[], d1[], d2[], d3[]}, [r0]
uint32x2x4_t vld4_dup_u32(__transfersize(4) uint32_t const * ptr); // VLD4.32 {d0[], d1[], d2[], d3[]}, [r0]
uint64x1x4_t vld4_dup_u64(__transfersize(4) uint64_t const * ptr); // VLD1.64 {d0, d1, d2, d3}, [r0]
int8x8x4_t vld4_dup_s8(__transfersize(4) int8_t const * ptr); // VLD4.8 {d0[], d1[], d2[], d3[]}, [r0]
int16x4x4_t vld4_dup_s16(__transfersize(4) int16_t const * ptr); // VLD4.16 {d0[], d1[], d2[], d3[]}, [r0]
int32x2x4_t vld4_dup_s32(__transfersize(4) int32_t const * ptr); // VLD4.32 {d0[], d1[], d2[], d3[]}, [r0]
int64x1x4_t vld4_dup_s64(__transfersize(4) int64_t const * ptr); // VLD1.64 {d0, d1, d2, d3}, [r0]
float16x4x4_t vld4_dup_f16(__transfersize(4) __fp16 const * ptr); // VLD4.16 {d0[], d1[], d2[], d3[]}, [r0]
float32x2x4_t vld4_dup_f32(__transfersize(4) float32_t const * ptr); // VLD4.32 {d0[], d1[], d2[], d3[]}, [r0]
poly8x8x4_t vld4_dup_p8(__transfersize(4) poly8_t const * ptr); // VLD4.8 {d0[], d1[], d2[], d3[]}, [r0]
poly16x4x4_t vld4_dup_p16(__transfersize(4) poly16_t const * ptr); // VLD4.16 {d0[], d1[], d2[], d3[]}, [r0]
//Load a single lane of N-element structure from memory
//the functions below are modified to deal with the error C2719: 'src': formal parameter with __declspec(align('16')) won't be aligned
uint16x8x2_t vld2q_lane_u16_ptr(__transfersize(2) uint16_t const * ptr, uint16x8x2_t * src, __constrange(0,7) int lane); // VLD2.16 {d0[0], d2[0]}, [r0]
uint32x4x2_t vld2q_lane_u32_ptr(__transfersize(2) uint32_t const * ptr, uint32x4x2_t * src, __constrange(0,3) int lane); // VLD2.32 {d0[0], d2[0]}, [r0]
int16x8x2_t vld2q_lane_s16_ptr(__transfersize(2) int16_t const * ptr, int16x8x2_t * src, __constrange(0,7) int lane); // VLD2.16 {d0[0], d2[0]}, [r0]
int32x4x2_t vld2q_lane_s32_ptr(__transfersize(2) int32_t const * ptr, int32x4x2_t * src, __constrange(0,3) int lane); // VLD2.32 {d0[0], d2[0]}, [r0]
float16x8x2_t vld2q_lane_f16_ptr(__transfersize(2) __fp16 const * ptr, float16x8x2_t * src, __constrange(0,7) int lane); // VLD2.16 {d0[0], d2[0]}, [r0]
float32x4x2_t vld2q_lane_f32_ptr(__transfersize(2) float32_t const * ptr, float32x4x2_t * src, __constrange(0,3) int lane); // VLD2.32 {d0[0], d2[0]}, [r0]
poly16x8x2_t vld2q_lane_p16_ptr(__transfersize(2) poly16_t const * ptr, poly16x8x2_t * src, __constrange(0,7) int lane); // VLD2.16 {d0[0], d2[0]}, [r0]
uint8x8x2_t vld2_lane_u8_ptr(__transfersize(2) uint8_t const * ptr, uint8x8x2_t * src, __constrange(0,7) int lane); //VLD2.8 {d0[0], d1[0]}, [r0]
uint16x4x2_t vld2_lane_u16_ptr(__transfersize(2) uint16_t const * ptr, uint16x4x2_t * src, __constrange(0,3) int lane); // VLD2.16 {d0[0], d1[0]}, [r0]
uint32x2x2_t vld2_lane_u32_ptr(__transfersize(2) uint32_t const * ptr, uint32x2x2_t * src, __constrange(0,1) int lane); // VLD2.32 {d0[0], d1[0]}, [r0]
int8x8x2_t vld2_lane_s8_ptr(__transfersize(2) int8_t const * ptr, int8x8x2_t * src, __constrange(0,7) int lane); //VLD2.8 {d0[0], d1[0]}, [r0]
int16x4x2_t vld2_lane_s16_ptr(__transfersize(2) int16_t const * ptr, int16x4x2_t * src, __constrange(0,3) int lane); //VLD2.16 {d0[0], d1[0]}, [r0]
int32x2x2_t vld2_lane_s32_ptr(__transfersize(2) int32_t const * ptr, int32x2x2_t * src, __constrange(0,1) int lane); //VLD2.32 {d0[0], d1[0]}, [r0]
//float16x4x2_t vld2_lane_f16_ptr(__transfersize(2) __fp16 const * ptr, float16x4x2_t * src, __constrange(0,3) int lane); // VLD2.16 {d0[0], d1[0]}, [r0]
float32x2x2_t vld2_lane_f32_ptr(__transfersize(2) float32_t const * ptr, float32x2x2_t * src, __constrange(0,1) int lane); // VLD2.32 {d0[0], d1[0]}, [r0]
poly8x8x2_t vld2_lane_p8_ptr(__transfersize(2) poly8_t const * ptr, poly8x8x2_t * src, __constrange(0,7) int lane); //VLD2.8 {d0[0], d1[0]}, [r0]
poly16x4x2_t vld2_lane_p16_ptr(__transfersize(2) poly16_t const * ptr, poly16x4x2_t * src, __constrange(0,3) int lane); // VLD2.16 {d0[0], d1[0]}, [r0]
uint16x8x3_t vld3q_lane_u16_ptr(__transfersize(3) uint16_t const * ptr, uint16x8x3_t * src, __constrange(0,7) int lane); // VLD3.16 {d0[0], d2[0], d4[0]}, [r0]
uint32x4x3_t vld3q_lane_u32_ptr(__transfersize(3) uint32_t const * ptr, uint32x4x3_t * src, __constrange(0,3) int lane); // VLD3.32 {d0[0], d2[0], d4[0]}, [r0]
int16x8x3_t vld3q_lane_s16_ptr(__transfersize(3) int16_t const * ptr, int16x8x3_t * src, __constrange(0,7) int lane); // VLD3.16 {d0[0], d2[0], d4[0]}, [r0]
int32x4x3_t vld3q_lane_s32_ptr(__transfersize(3) int32_t const * ptr, int32x4x3_t * src, __constrange(0,3) int lane); // VLD3.32 {d0[0], d2[0], d4[0]}, [r0]
float16x8x3_t vld3q_lane_f16_ptr(__transfersize(3) __fp16 const * ptr, float16x8x3_t * src, __constrange(0,7) int lane); // VLD3.16 {d0[0], d2[0], d4[0]}, [r0]
float32x4x3_t vld3q_lane_f32_ptr(__transfersize(3) float32_t const * ptr, float32x4x3_t * src, __constrange(0,3) int lane); // VLD3.32 {d0[0], d2[0], d4[0]}, [r0]
poly16x8x3_t vld3q_lane_p16_ptr(__transfersize(3) poly16_t const * ptr, poly16x8x3_t * src, __constrange(0,7) int lane); // VLD3.16 {d0[0], d2[0], d4[0]}, [r0]
uint8x8x3_t vld3_lane_u8_ptr(__transfersize(3) uint8_t const * ptr, uint8x8x3_t * src, __constrange(0,7) int lane); //VLD3.8 {d0[0], d1[0], d2[0]}, [r0]
uint16x4x3_t vld3_lane_u16_ptr(__transfersize(3) uint16_t const * ptr, uint16x4x3_t * src, __constrange(0,3) int lane); // VLD3.16 {d0[0], d1[0], d2[0]}, [r0]
uint32x2x3_t vld3_lane_u32_ptr(__transfersize(3) uint32_t const * ptr, uint32x2x3_t * src, __constrange(0,1) int lane); // VLD3.32 {d0[0], d1[0], d2[0]}, [r0]
int8x8x3_t vld3_lane_s8_ptr(__transfersize(3) int8_t const * ptr, int8x8x3_t * src, __constrange(0,7) int lane); //VLD3.8 {d0[0], d1[0], d2[0]}, [r0]
int16x4x3_t vld3_lane_s16_ptr(__transfersize(3) int16_t const * ptr, int16x4x3_t * src, __constrange(0,3) int lane); //VLD3.16 {d0[0], d1[0], d2[0]}, [r0]
int32x2x3_t vld3_lane_s32_ptr(__transfersize(3) int32_t const * ptr, int32x2x3_t * src, __constrange(0,1) int lane); //VLD3.32 {d0[0], d1[0], d2[0]}, [r0]
float16x4x3_t vld3_lane_f16_ptr(__transfersize(3) __fp16 const * ptr, float16x4x3_t * src, __constrange(0,3) int lane); // VLD3.16 {d0[0], d1[0], d2[0]}, [r0]
float32x2x3_t vld3_lane_f32_ptr(__transfersize(3) float32_t const * ptr, float32x2x3_t * src, __constrange(0,1) int lane); // VLD3.32 {d0[0], d1[0], d2[0]}, [r0]
poly8x8x3_t vld3_lane_p8_ptr(__transfersize(3) poly8_t const * ptr, poly8x8x3_t * src, __constrange(0,7) int lane); //VLD3.8 {d0[0], d1[0], d2[0]}, [r0]
poly16x4x3_t vld3_lane_p16_ptr(__transfersize(3) poly16_t const * ptr, poly16x4x3_t * src, __constrange(0,3) int lane); // VLD3.16 {d0[0], d1[0], d2[0]}, [r0]
uint16x8x4_t vld4q_lane_u16_ptr(__transfersize(4) uint16_t const * ptr, uint16x8x4_t * src, __constrange(0,7) int lane); // VLD4.16 {d0[0], d2[0], d4[0], d6[0]}, [r0]
uint32x4x4_t vld4q_lane_u32_ptr(__transfersize(4) uint32_t const * ptr, uint32x4x4_t * src, __constrange(0,3) int lane); // VLD4.32 {d0[0], d2[0], d4[0], d6[0]}, [r0]
int16x8x4_t vld4q_lane_s16_ptr(__transfersize(4) int16_t const * ptr, int16x8x4_t * src, __constrange(0,7) int lane); // VLD4.16 {d0[0], d2[0], d4[0], d6[0]}, [r0]
int32x4x4_t vld4q_lane_s32_ptr(__transfersize(4) int32_t const * ptr, int32x4x4_t * src, __constrange(0,3) int lane); // VLD4.32 {d0[0], d2[0], d4[0], d6[0]}, [r0]
float16x8x4_t vld4q_lane_f16_ptr(__transfersize(4) __fp16 const * ptr, float16x8x4_t * src, __constrange(0,7) int lane); // VLD4.16 {d0[0], d2[0], d4[0], d6[0]}, [r0]
float32x4x4_t vld4q_lane_f32_ptr(__transfersize(4) float32_t const * ptr, float32x4x4_t * src, __constrange(0,3) int lane); // VLD4.32 {d0[0], d2[0], d4[0], d6[0]}, [r0]
poly16x8x4_t vld4q_lane_p16_ptr(__transfersize(4) poly16_t const * ptr, poly16x8x4_t * src, __constrange(0,7) int lane); // VLD4.16 {d0[0], d2[0], d4[0], d6[0]}, [r0]
uint8x8x4_t vld4_lane_u8_ptr(__transfersize(4) uint8_t const * ptr, uint8x8x4_t * src, __constrange(0,7) int lane); //VLD4.8 {d0[0], d1[0], d2[0], d3[0]}, [r0]
uint16x4x4_t vld4_lane_u16_ptr(__transfersize(4) uint16_t const * ptr, uint16x4x4_t * src, __constrange(0,3) int lane); // VLD4.16 {d0[0], d1[0], d2[0], d3[0]}, [r0]
uint32x2x4_t vld4_lane_u32_ptr(__transfersize(4) uint32_t const * ptr, uint32x2x4_t * src, __constrange(0,1) int lane); // VLD4.32 {d0[0], d1[0], d2[0], d3[0]}, [r0]
int8x8x4_t vld4_lane_s8_ptr(__transfersize(4) int8_t const * ptr, int8x8x4_t * src, __constrange(0,7) int lane); //VLD4.8 {d0[0], d1[0], d2[0], d3[0]}, [r0]
int16x4x4_t vld4_lane_s16_ptr(__transfersize(4) int16_t const * ptr, int16x4x4_t * src, __constrange(0,3) int lane); //VLD4.16 {d0[0], d1[0], d2[0], d3[0]}, [r0]
int32x2x4_t vld4_lane_s32_ptr(__transfersize(4) int32_t const * ptr, int32x2x4_t * src, __constrange(0,1) int lane); //VLD4.32 {d0[0], d1[0], d2[0], d3[0]}, [r0]
float16x4x4_t vld4_lane_f16_ptr(__transfersize(4) __fp16 const * ptr, float16x4x4_t * src, __constrange(0,3) int lane); // VLD4.16 {d0[0], d1[0], d2[0], d3[0]}, [r0]
float32x2x4_t vld4_lane_f32_ptr(__transfersize(4) float32_t const * ptr, float32x2x4_t * src, __constrange(0,1) int lane); // VLD4.32 {d0[0], d1[0], d2[0], d3[0]}, [r0]
poly8x8x4_t vld4_lane_p8_ptr(__transfersize(4) poly8_t const * ptr, poly8x8x4_t * src, __constrange(0,7) int lane); //VLD4.8 {d0[0], d1[0], d2[0], d3[0]}, [r0]
poly16x4x4_t vld4_lane_p16_ptr(__transfersize(4) poly16_t const * ptr, poly16x4x4_t * src, __constrange(0,3) int lane); // VLD4.16 {d0[0], d1[0], d2[0], d3[0]}, [r0]
//Store N-element structure to memory
void vst2q_u8_ptr(__transfersize(32) uint8_t * ptr, uint8x16x2_t * val); // VST2.8 {d0, d2}, [r0]
void vst2q_u16_ptr(__transfersize(16) uint16_t * ptr, uint16x8x2_t * val); // VST2.16 {d0, d2}, [r0]
void vst2q_u32_ptr(__transfersize(8) uint32_t * ptr, uint32x4x2_t * val); // VST2.32 {d0, d2}, [r0]
void vst2q_s8_ptr(__transfersize(32) int8_t * ptr, int8x16x2_t * val); // VST2.8 {d0, d2}, [r0]
void vst2q_s16_ptr(__transfersize(16) int16_t * ptr, int16x8x2_t * val); // VST2.16 {d0, d2}, [r0]
void vst2q_s32_ptr(__transfersize(8) int32_t * ptr, int32x4x2_t * val); // VST2.32 {d0, d2}, [r0]
void vst2q_f16_ptr(__transfersize(16) __fp16 * ptr, float16x8x2_t * val); // VST2.16 {d0, d2}, [r0]
void vst2q_f32_ptr(__transfersize(8) float32_t * ptr, float32x4x2_t * val); // VST2.32 {d0, d2}, [r0]
void vst2q_p8_ptr(__transfersize(32) poly8_t * ptr, poly8x16x2_t * val); // VST2.8 {d0, d2}, [r0]
void vst2q_p16_ptr(__transfersize(16) poly16_t * ptr, poly16x8x2_t * val); // VST2.16 {d0, d2}, [r0]
void vst2_u8_ptr(__transfersize(16) uint8_t * ptr, uint8x8x2_t * val); // VST2.8 {d0, d1}, [r0]
void vst2_u16_ptr(__transfersize(8) uint16_t * ptr, uint16x4x2_t * val); // VST2.16 {d0, d1}, [r0]
void vst2_u32_ptr(__transfersize(4) uint32_t * ptr, uint32x2x2_t * val); // VST2.32 {d0, d1}, [r0]
void vst2_u64_ptr(__transfersize(2) uint64_t * ptr, uint64x1x2_t * val); // VST1.64 {d0, d1}, [r0]
void vst2_s8_ptr(__transfersize(16) int8_t * ptr, int8x8x2_t * val); // VST2.8 {d0, d1}, [r0]
void vst2_s16_ptr(__transfersize(8) int16_t * ptr, int16x4x2_t * val); // VST2.16 {d0, d1}, [r0]
void vst2_s32_ptr(__transfersize(4) int32_t * ptr, int32x2x2_t * val); // VST2.32 {d0, d1}, [r0]
void vst2_s64_ptr(__transfersize(2) int64_t * ptr, int64x1x2_t * val); // VST1.64 {d0, d1}, [r0]
//void vst2_f16_ptr(__transfersize(8) __fp16 * ptr, float16x4x2_t * val); // VST2.16 {d0, d1}, [r0]
void vst2_f32_ptr(__transfersize(4) float32_t * ptr, float32x2x2_t * val); // VST2.32 {d0, d1}, [r0]
void vst2_p8_ptr(__transfersize(16) poly8_t * ptr, poly8x8x2_t * val); // VST2.8 {d0, d1}, [r0]
void vst2_p16_ptr(__transfersize(8) poly16_t * ptr, poly16x4x2_t * val); // VST2.16 {d0, d1}, [r0]
void vst3q_u8_ptr(__transfersize(48) uint8_t * ptr, uint8x16x3_t * val); // VST3.8 {d0, d2, d4}, [r0]
void vst3q_u16_ptr(__transfersize(24) uint16_t * ptr, uint16x8x3_t * val); // VST3.16 {d0, d2, d4}, [r0]
void vst3q_u32_ptr(__transfersize(12) uint32_t * ptr, uint32x4x3_t * val); // VST3.32 {d0, d2, d4}, [r0]
void vst3q_s8_ptr(__transfersize(48) int8_t * ptr, int8x16x3_t * val); // VST3.8 {d0, d2, d4}, [r0]
void vst3q_s16_ptr(__transfersize(24) int16_t * ptr, int16x8x3_t * val); // VST3.16 {d0, d2, d4}, [r0]
void vst3q_s32_ptr(__transfersize(12) int32_t * ptr, int32x4x3_t * val); // VST3.32 {d0, d2, d4}, [r0]
void vst3q_f16_ptr(__transfersize(24) __fp16 * ptr, float16x8x3_t * val); // VST3.16 {d0, d2, d4}, [r0]
void vst3q_f32_ptr(__transfersize(12) float32_t * ptr, float32x4x3_t * val); // VST3.32 {d0, d2, d4}, [r0]
void vst3q_p8_ptr(__transfersize(48) poly8_t * ptr, poly8x16x3_t * val); // VST3.8 {d0, d2, d4}, [r0]
void vst3q_p16_ptr(__transfersize(24) poly16_t * ptr, poly16x8x3_t * val); // VST3.16 {d0, d2, d4}, [r0]
void vst3_u8_ptr(__transfersize(24) uint8_t * ptr, uint8x8x3_t * val); // VST3.8 {d0, d1, d2}, [r0]
void vst3_u16_ptr(__transfersize(12) uint16_t * ptr, uint16x4x3_t * val); // VST3.16 {d0, d1, d2}, [r0]
void vst3_u32_ptr(__transfersize(6) uint32_t * ptr, uint32x2x3_t * val); // VST3.32 {d0, d1, d2}, [r0]
void vst3_u64_ptr(__transfersize(3) uint64_t * ptr, uint64x1x3_t * val); // VST1.64 {d0, d1, d2}, [r0]
void vst3_s8_ptr(__transfersize(24) int8_t * ptr, int8x8x3_t * val); // VST3.8 {d0, d1, d2}, [r0]
void vst3_s16_ptr(__transfersize(12) int16_t * ptr, int16x4x3_t * val); // VST3.16 {d0, d1, d2}, [r0]
void vst3_s32_ptr(__transfersize(6) int32_t * ptr, int32x2x3_t * val); // VST3.32 {d0, d1, d2}, [r0]
void vst3_s64_ptr(__transfersize(3) int64_t * ptr, int64x1x3_t * val); // VST1.64 {d0, d1, d2}, [r0]
void vst3_f16_ptr(__transfersize(12) __fp16 * ptr, float16x4x3_t * val); // VST3.16 {d0, d1, d2}, [r0]
void vst3_f32_ptr(__transfersize(6) float32_t * ptr, float32x2x3_t * val); // VST3.32 {d0, d1, d2}, [r0]
void vst3_p8_ptr(__transfersize(24) poly8_t * ptr, poly8x8x3_t * val); // VST3.8 {d0, d1, d2}, [r0]
void vst3_p16_ptr(__transfersize(12) poly16_t * ptr, poly16x4x3_t * val); // VST3.16 {d0, d1, d2}, [r0]
void vst4q_u8_ptr(__transfersize(64) uint8_t * ptr, uint8x16x4_t * val); // VST4.8 {d0, d2, d4, d6}, [r0]
void vst4q_u16_ptr(__transfersize(32) uint16_t * ptr, uint16x8x4_t * val); // VST4.16 {d0, d2, d4, d6}, [r0]
void vst4q_u32_ptr(__transfersize(16) uint32_t * ptr, uint32x4x4_t * val); // VST4.32 {d0, d2, d4, d6}, [r0]
void vst4q_s8_ptr(__transfersize(64) int8_t * ptr, int8x16x4_t * val); // VST4.8 {d0, d2, d4, d6}, [r0]
void vst4q_s16_ptr(__transfersize(32) int16_t * ptr, int16x8x4_t * val); // VST4.16 {d0, d2, d4, d6}, [r0]
void vst4q_s32_ptr(__transfersize(16) int32_t * ptr, int32x4x4_t * val); // VST4.32 {d0, d2, d4, d6}, [r0]
void vst4q_f16_ptr(__transfersize(32) __fp16 * ptr, float16x8x4_t * val); // VST4.16 {d0, d2, d4, d6}, [r0]
void vst4q_f32_ptr(__transfersize(16) float32_t * ptr, float32x4x4_t * val); // VST4.32 {d0, d2, d4, d6}, [r0]
void vst4q_p8_ptr(__transfersize(64) poly8_t * ptr, poly8x16x4_t * val); // VST4.8 {d0, d2, d4, d6}, [r0]
void vst4q_p16_ptr(__transfersize(32) poly16_t * ptr, poly16x8x4_t * val); // VST4.16 {d0, d2, d4, d6}, [r0]
void vst4_u8_ptr(__transfersize(32) uint8_t * ptr, uint8x8x4_t * val); // VST4.8 {d0, d1, d2, d3}, [r0]
void vst4_u16_ptr(__transfersize(16) uint16_t * ptr, uint16x4x4_t * val); // VST4.16 {d0, d1, d2, d3}, [r0]
void vst4_u32_ptr(__transfersize(8) uint32_t * ptr, uint32x2x4_t * val); // VST4.32 {d0, d1, d2, d3}, [r0]
void vst4_u64_ptr(__transfersize(4) uint64_t * ptr, uint64x1x4_t * val); // VST1.64 {d0, d1, d2, d3}, [r0]
void vst4_s8_ptr(__transfersize(32) int8_t * ptr, int8x8x4_t * val); // VST4.8 {d0, d1, d2, d3}, [r0]
void vst4_s16_ptr(__transfersize(16) int16_t * ptr, int16x4x4_t * val); // VST4.16 {d0, d1, d2, d3}, [r0]
void vst4_s32_ptr(__transfersize(8) int32_t * ptr, int32x2x4_t * val); // VST4.32 {d0, d1, d2, d3}, [r0]
void vst4_s64_ptr(__transfersize(4) int64_t * ptr, int64x1x4_t * val); // VST1.64 {d0, d1, d2, d3}, [r0]
void vst4_f16_ptr(__transfersize(16) __fp16 * ptr, float16x4x4_t * val); // VST4.16 {d0, d1, d2, d3}, [r0]
void vst4_f32_ptr(__transfersize(8) float32_t * ptr, float32x2x4_t * val); // VST4.32 {d0, d1, d2, d3}, [r0]
void vst4_p8_ptr(__transfersize(32) poly8_t * ptr, poly8x8x4_t * val); // VST4.8 {d0, d1, d2, d3}, [r0]
void vst4_p16_ptr(__transfersize(16) poly16_t * ptr, poly16x4x4_t * val); // VST4.16 {d0, d1, d2, d3}, [r0]
//Store a single lane of N-element structure to memory
void vst2q_lane_u16_ptr(__transfersize(2) uint16_t * ptr, uint16x8x2_t * val, __constrange(0,7) int lane); // VST2.16{d0[0], d2[0]}, [r0]
void vst2q_lane_u32_ptr(__transfersize(2) uint32_t * ptr, uint32x4x2_t * val, __constrange(0,3) int lane); // VST2.32{d0[0], d2[0]}, [r0]
void vst2q_lane_s16_ptr(__transfersize(2) int16_t * ptr, int16x8x2_t * val, __constrange(0,7) int lane); // VST2.16{d0[0], d2[0]}, [r0]
void vst2q_lane_s32_ptr(__transfersize(2) int32_t * ptr, int32x4x2_t * val, __constrange(0,3) int lane); // VST2.32{d0[0], d2[0]}, [r0]
void vst2q_lane_f16_ptr(__transfersize(2) __fp16 * ptr, float16x8x2_t * val, __constrange(0,7) int lane); // VST2.16{d0[0], d2[0]}, [r0]
void vst2q_lane_f32_ptr(__transfersize(2) float32_t * ptr, float32x4x2_t * val, __constrange(0,3) int lane); //VST2.32 {d0[0], d2[0]}, [r0]
void vst2q_lane_p16_ptr(__transfersize(2) poly16_t * ptr, poly16x8x2_t * val, __constrange(0,7) int lane); // VST2.16{d0[0], d2[0]}, [r0]
void vst2_lane_u8_ptr(__transfersize(2) uint8_t * ptr, uint8x8x2_t * val, __constrange(0,7) int lane); // VST2.8{d0[0], d1[0]}, [r0]
void vst2_lane_u16_ptr(__transfersize(2) uint16_t * ptr, uint16x4x2_t * val, __constrange(0,3) int lane); // VST2.16{d0[0], d1[0]}, [r0]
void vst2_lane_u32_ptr(__transfersize(2) uint32_t * ptr, uint32x2x2_t * val, __constrange(0,1) int lane); // VST2.32{d0[0], d1[0]}, [r0]
void vst2_lane_s8_ptr(__transfersize(2) int8_t * ptr, int8x8x2_t * val, __constrange(0,7) int lane); // VST2.8 {d0[0],d1[0]}, [r0]
void vst2_lane_s16_ptr(__transfersize(2) int16_t * ptr, int16x4x2_t * val, __constrange(0,3) int lane); // VST2.16{d0[0], d1[0]}, [r0]
void vst2_lane_s32_ptr(__transfersize(2) int32_t * ptr, int32x2x2_t * val, __constrange(0,1) int lane); // VST2.32{d0[0], d1[0]}, [r0]
void vst2_lane_f16_ptr(__transfersize(2) __fp16 * ptr, float16x4x2_t * val, __constrange(0,3) int lane); // VST2.16{d0[0], d1[0]}, [r0]
void vst2_lane_f32_ptr(__transfersize(2) float32_t * ptr, float32x2x2_t * val, __constrange(0,1) int lane); // VST2.32{d0[0], d1[0]}, [r0]
void vst2_lane_p8_ptr(__transfersize(2) poly8_t * ptr, poly8x8x2_t * val, __constrange(0,7) int lane); // VST2.8{d0[0], d1[0]}, [r0]
void vst2_lane_p16_ptr(__transfersize(2) poly16_t * ptr, poly16x4x2_t * val, __constrange(0,3) int lane); // VST2.16{d0[0], d1[0]}, [r0]
void vst3q_lane_u16_ptr(__transfersize(3) uint16_t * ptr, uint16x8x3_t * val, __constrange(0,7) int lane); // VST3.16{d0[0], d2[0], d4[0]}, [r0]
void vst3q_lane_u32_ptr(__transfersize(3) uint32_t * ptr, uint32x4x3_t * val, __constrange(0,3) int lane); // VST3.32{d0[0], d2[0], d4[0]}, [r0]
void vst3q_lane_s16_ptr(__transfersize(3) int16_t * ptr, int16x8x3_t * val, __constrange(0,7) int lane); // VST3.16{d0[0], d2[0], d4[0]}, [r0]
void vst3q_lane_s32_ptr(__transfersize(3) int32_t * ptr, int32x4x3_t * val, __constrange(0,3) int lane); // VST3.32{d0[0], d2[0], d4[0]}, [r0]
void vst3q_lane_f16_ptr(__transfersize(3) __fp16 * ptr, float16x8x3_t * val, __constrange(0,7) int lane); // VST3.16{d0[0], d2[0], d4[0]}, [r0]
void vst3q_lane_f32_ptr(__transfersize(3) float32_t * ptr, float32x4x3_t * val, __constrange(0,3) int lane); //VST3.32 {d0[0], d2[0], d4[0]}, [r0]
void vst3q_lane_p16_ptr(__transfersize(3) poly16_t * ptr, poly16x8x3_t * val, __constrange(0,7) int lane); // VST3.16{d0[0], d2[0], d4[0]}, [r0]
void vst3_lane_u8_ptr(__transfersize(3) uint8_t * ptr, uint8x8x3_t * val, __constrange(0,7) int lane); // VST3.8{d0[0], d1[0], d2[0]}, [r0]
void vst3_lane_u16_ptr(__transfersize(3) uint16_t * ptr, uint16x4x3_t * val, __constrange(0,3) int lane); // VST3.16{d0[0], d1[0], d2[0]}, [r0]
void vst3_lane_u32_ptr(__transfersize(3) uint32_t * ptr, uint32x2x3_t * val, __constrange(0,1) int lane); // VST3.32{d0[0], d1[0], d2[0]}, [r0]
void vst3_lane_s8_ptr(__transfersize(3) int8_t * ptr, int8x8x3_t * val, __constrange(0,7) int lane); // VST3.8 {d0[0],d1[0], d2[0]}, [r0]
void vst3_lane_s16_ptr(__transfersize(3) int16_t * ptr, int16x4x3_t * val, __constrange(0,3) int lane); // VST3.16{d0[0], d1[0], d2[0]}, [r0]
void vst3_lane_s32_ptr(__transfersize(3) int32_t * ptr, int32x2x3_t * val, __constrange(0,1) int lane); // VST3.32{d0[0], d1[0], d2[0]}, [r0]
void vst3_lane_f16_ptr(__transfersize(3) __fp16 * ptr, float16x4x3_t * val, __constrange(0,3) int lane); // VST3.16{d0[0], d1[0], d2[0]}, [r0]
void vst3_lane_f32_ptr(__transfersize(3) float32_t * ptr, float32x2x3_t * val, __constrange(0,1) int lane); // VST3.32{d0[0], d1[0], d2[0]}, [r0]
void vst3_lane_p8_ptr(__transfersize(3) poly8_t * ptr, poly8x8x3_t * val, __constrange(0,7) int lane); // VST3.8{d0[0], d1[0], d2[0]}, [r0]
void vst3_lane_p16_ptr(__transfersize(3) poly16_t * ptr, poly16x4x3_t * val, __constrange(0,3) int lane); // VST3.16{d0[0], d1[0], d2[0]}, [r0]
void vst4q_lane_u16_ptr(__transfersize(4) uint16_t * ptr, uint16x8x4_t * val, __constrange(0,7) int lane); // VST4.16{d0[0], d2[0], d4[0], d6[0]}, [r0]
void vst4q_lane_u32_ptr(__transfersize(4) uint32_t * ptr, uint32x4x4_t * val, __constrange(0,3) int lane); // VST4.32{d0[0], d2[0], d4[0], d6[0]}, [r0]
void vst4q_lane_s16_ptr(__transfersize(4) int16_t * ptr, int16x8x4_t * val, __constrange(0,7) int lane); // VST4.16{d0[0], d2[0], d4[0], d6[0]}, [r0]
void vst4q_lane_s32_ptr(__transfersize(4) int32_t * ptr, int32x4x4_t * val, __constrange(0,3) int lane); // VST4.32{d0[0], d2[0], d4[0], d6[0]}, [r0]
void vst4q_lane_f16_ptr(__transfersize(4) __fp16 * ptr, float16x8x4_t * val, __constrange(0,7) int lane); // VST4.16{d0[0], d2[0], d4[0], d6[0]}, [r0]
void vst4q_lane_f32_ptr(__transfersize(4) float32_t * ptr, float32x4x4_t * val, __constrange(0,3) int lane); //VST4.32 {d0[0], d2[0], d4[0], d6[0]}, [r0]
void vst4q_lane_p16_ptr(__transfersize(4) poly16_t * ptr, poly16x8x4_t * val, __constrange(0,7) int lane); // VST4.16{d0[0], d2[0], d4[0], d6[0]}, [r0]
void vst4_lane_u8_ptr(__transfersize(4) uint8_t * ptr, uint8x8x4_t * val, __constrange(0,7) int lane); // VST4.8{d0[0], d1[0], d2[0], d3[0]}, [r0]
void vst4_lane_u16_ptr(__transfersize(4) uint16_t * ptr, uint16x4x4_t * val, __constrange(0,3) int lane); // VST4.16{d0[0], d1[0], d2[0], d3[0]}, [r0]
void vst4_lane_u32_ptr(__transfersize(4) uint32_t * ptr, uint32x2x4_t * val, __constrange(0,1) int lane); // VST4.32{d0[0], d1[0], d2[0], d3[0]}, [r0]
void vst4_lane_s8_ptr(__transfersize(4) int8_t * ptr, int8x8x4_t * val, __constrange(0,7) int lane); // VST4.8 {d0[0],d1[0], d2[0], d3[0]}, [r0]
void vst4_lane_s16_ptr(__transfersize(4) int16_t * ptr, int16x4x4_t * val, __constrange(0,3) int lane); // VST4.16{d0[0], d1[0], d2[0], d3[0]}, [r0]
void vst4_lane_s32_ptr(__transfersize(4) int32_t * ptr, int32x2x4_t * val, __constrange(0,1) int lane); // VST4.32{d0[0], d1[0], d2[0], d3[0]}, [r0]
void vst4_lane_f16_ptr(__transfersize(4) __fp16 * ptr, float16x4x4_t * val, __constrange(0,3) int lane); // VST4.16{d0[0], d1[0], d2[0], d3[0]}, [r0]
void vst4_lane_f32_ptr(__transfersize(4) float32_t * ptr, float32x2x4_t * val, __constrange(0,1) int lane); // VST4.32{d0[0], d1[0], d2[0], d3[0]}, [r0]
void vst4_lane_p8_ptr(__transfersize(4) poly8_t * ptr, poly8x8x4_t * val, __constrange(0,7) int lane); // VST4.8{d0[0], d1[0], d2[0], d3[0]}, [r0]
void vst4_lane_p16_ptr(__transfersize(4) poly16_t * ptr, poly16x4x4_t * val, __constrange(0,3) int lane); // VST4.16{d0[0], d1[0], d2[0], d3[0]}, [r0]
//Extract lanes from a vector and put into a register. These intrinsics extract a single lane (element) from a vector.
uint8_t vget_lane_u8(uint8x8_t vec, __constrange(0,7) int lane); // VMOV.U8 r0, d0[0]
uint16_t vget_lane_u16(uint16x4_t vec, __constrange(0,3) int lane); // VMOV.U16 r0, d0[0]
uint32_t vget_lane_u32(uint32x2_t vec, __constrange(0,1) int lane); // VMOV.32 r0, d0[0]
int8_t vget_lane_s8(int8x8_t vec, __constrange(0,7) int lane); // VMOV.S8 r0, d0[0]
int16_t vget_lane_s16(int16x4_t vec, __constrange(0,3) int lane); // VMOV.S16 r0, d0[0]
int32_t vget_lane_s32(int32x2_t vec, __constrange(0,1) int lane); // VMOV.32 r0, d0[0]
poly8_t vget_lane_p8(poly8x8_t vec, __constrange(0,7) int lane); // VMOV.U8 r0, d0[0]
poly16_t vget_lane_p16(poly16x4_t vec, __constrange(0,3) int lane); // VMOV.U16 r0, d0[0]
float32_t vget_lane_f32(float32x2_t vec, __constrange(0,1) int lane); // VMOV.32 r0, d0[0]
uint8_t vgetq_lane_u8(uint8x16_t vec, __constrange(0,15) int lane); // VMOV.U8 r0, d0[0]
uint16_t vgetq_lane_u16(uint16x8_t vec, __constrange(0,7) int lane); // VMOV.U16 r0, d0[0]
uint32_t vgetq_lane_u32(uint32x4_t vec, __constrange(0,3) int lane); // VMOV.32 r0, d0[0]
int8_t vgetq_lane_s8(int8x16_t vec, __constrange(0,15) int lane); // VMOV.S8 r0, d0[0]
int16_t vgetq_lane_s16(int16x8_t vec, __constrange(0,7) int lane); // VMOV.S16 r0, d0[0]
int32_t vgetq_lane_s32(int32x4_t vec, __constrange(0,3) int lane); // VMOV.32 r0, d0[0]
poly8_t vgetq_lane_p8(poly8x16_t vec, __constrange(0,15) int lane); // VMOV.U8 r0, d0[0]
poly16_t vgetq_lane_p16(poly16x8_t vec, __constrange(0,7) int lane); // VMOV.U16 r0, d0[0]
float32_t vgetq_lane_f32(float32x4_t vec, __constrange(0,3) int lane); // VMOV.32 r0, d0[0]
int64_t vget_lane_s64(int64x1_t vec, __constrange(0,0) int lane); // VMOV r0,r0,d0
uint64_t vget_lane_u64(uint64x1_t vec, __constrange(0,0) int lane); // VMOV r0,r0,d0
int64_t vgetq_lane_s64(int64x2_t vec, __constrange(0,1) int lane); // VMOV r0,r0,d0
uint64_t vgetq_lane_u64(uint64x2_t vec, __constrange(0,1) int lane); // VMOV r0,r0,d0
//Load a single lane of a vector from a literal. These intrinsics set a single lane (element) within a vector.
uint8x8_t vset_lane_u8(uint8_t value, uint8x8_t vec, __constrange(0,7) int lane); // VMOV.8 d0[0],r0
uint16x4_t vset_lane_u16(uint16_t value, uint16x4_t vec, __constrange(0,3) int lane); // VMOV.16 d0[0],r0
uint32x2_t vset_lane_u32(uint32_t value, uint32x2_t vec, __constrange(0,1) int lane); // VMOV.32 d0[0],r0
int8x8_t vset_lane_s8(int8_t value, int8x8_t vec, __constrange(0,7) int lane); // VMOV.8 d0[0],r0
int16x4_t vset_lane_s16(int16_t value, int16x4_t vec, __constrange(0,3) int lane); // VMOV.16 d0[0],r0
int32x2_t vset_lane_s32(int32_t value, int32x2_t vec, __constrange(0,1) int lane); // VMOV.32 d0[0],r0
poly8x8_t vset_lane_p8(poly8_t value, poly8x8_t vec, __constrange(0,7) int lane); // VMOV.8 d0[0],r0
poly16x4_t vset_lane_p16(poly16_t value, poly16x4_t vec, __constrange(0,3) int lane); // VMOV.16 d0[0],r0
float32x2_t vset_lane_f32(float32_t value, float32x2_t vec, __constrange(0,1) int lane); // VMOV.32 d0[0],r0
uint8x16_t vsetq_lane_u8(uint8_t value, uint8x16_t vec, __constrange(0,15) int lane); // VMOV.8 d0[0],r0
uint16x8_t vsetq_lane_u16(uint16_t value, uint16x8_t vec, __constrange(0,7) int lane); // VMOV.16 d0[0],r0
uint32x4_t vsetq_lane_u32(uint32_t value, uint32x4_t vec, __constrange(0,3) int lane); // VMOV.32 d0[0],r0
int8x16_t vsetq_lane_s8(int8_t value, int8x16_t vec, __constrange(0,15) int lane); // VMOV.8 d0[0],r0
int16x8_t vsetq_lane_s16(int16_t value, int16x8_t vec, __constrange(0,7) int lane); // VMOV.16 d0[0],r0
int32x4_t vsetq_lane_s32(int32_t value, int32x4_t vec, __constrange(0,3) int lane); // VMOV.32 d0[0],r0
poly8x16_t vsetq_lane_p8(poly8_t value, poly8x16_t vec, __constrange(0,15) int lane); // VMOV.8 d0[0],r0
poly16x8_t vsetq_lane_p16(poly16_t value, poly16x8_t vec, __constrange(0,7) int lane); // VMOV.16 d0[0],r0
float32x4_t vsetq_lane_f32(float32_t value, float32x4_t vec, __constrange(0,3) int lane); // VMOV.32 d0[0],r0
int64x1_t vset_lane_s64(int64_t value, int64x1_t vec, __constrange(0,0) int lane); // VMOV d0,r0,r0
uint64x1_t vset_lane_u64(uint64_t value, uint64x1_t vec, __constrange(0,0) int lane); // VMOV d0,r0,r0
int64x2_t vsetq_lane_s64(int64_t value, int64x2_t vec, __constrange(0,1) int lane); // VMOV d0,r0,r0
uint64x2_t vsetq_lane_u64(uint64_t value, uint64x2_t vec, __constrange(0,1) int lane); // VMOV d0,r0,r0
//Initialize a vector from a literal bit pattern.
int8x8_t vcreate_s8(uint64_t a); // VMOV d0,r0,r0
int16x4_t vcreate_s16(uint64_t a); // VMOV d0,r0,r0
int32x2_t vcreate_s32(uint64_t a); // VMOV d0,r0,r0
float16x4_t vcreate_f16(uint64_t a); // VMOV d0,r0,r0
float32x2_t vcreate_f32(uint64_t a); // VMOV d0,r0,r0
uint8x8_t vcreate_u8(uint64_t a); // VMOV d0,r0,r0
uint16x4_t vcreate_u16(uint64_t a); // VMOV d0,r0,r0
uint32x2_t vcreate_u32(uint64_t a); // VMOV d0,r0,r0
uint64x1_t vcreate_u64(uint64_t a); // VMOV d0,r0,r0
poly8x8_t vcreate_p8(uint64_t a); // VMOV d0,r0,r0
poly16x4_t vcreate_p16(uint64_t a); // VMOV d0,r0,r0
int64x1_t vcreate_s64(uint64_t a); // VMOV d0,r0,r0
//Set all lanes to same value
//Load all lanes of vector to the same literal value
uint8x8_t vdup_n_u8(uint8_t value); // VDUP.8 d0,r0
uint16x4_t vdup_n_u16(uint16_t value); // VDUP.16 d0,r0
uint32x2_t vdup_n_u32(uint32_t value); // VDUP.32 d0,r0
int8x8_t vdup_n_s8(int8_t value); // VDUP.8 d0,r0
int16x4_t vdup_n_s16(int16_t value); // VDUP.16 d0,r0
int32x2_t vdup_n_s32(int32_t value); // VDUP.32 d0,r0
poly8x8_t vdup_n_p8(poly8_t value); // VDUP.8 d0,r0
poly16x4_t vdup_n_p16(poly16_t value); // VDUP.16 d0,r0
float32x2_t vdup_n_f32(float32_t value); // VDUP.32 d0,r0
uint8x16_t vdupq_n_u8(uint8_t value); // VDUP.8 q0,r0
uint16x8_t vdupq_n_u16(uint16_t value); // VDUP.16 q0,r0
uint32x4_t vdupq_n_u32(uint32_t value); // VDUP.32 q0,r0
int8x16_t vdupq_n_s8(int8_t value); // VDUP.8 q0,r0
int16x8_t vdupq_n_s16(int16_t value); // VDUP.16 q0,r0
int32x4_t vdupq_n_s32(int32_t value); // VDUP.32 q0,r0
poly8x16_t vdupq_n_p8(poly8_t value); // VDUP.8 q0,r0
poly16x8_t vdupq_n_p16(poly16_t value); // VDUP.16 q0,r0
float32x4_t vdupq_n_f32(float32_t value); // VDUP.32 q0,r0
int64x1_t vdup_n_s64(int64_t value); // VMOV d0,r0,r0
uint64x1_t vdup_n_u64(uint64_t value); // VMOV d0,r0,r0
int64x2_t vdupq_n_s64(int64_t value); // VMOV d0,r0,r0
uint64x2_t vdupq_n_u64(uint64_t value); // VMOV d0,r0,r0
uint8x8_t vmov_n_u8(uint8_t value); // VDUP.8 d0,r0
uint16x4_t vmov_n_u16(uint16_t value); // VDUP.16 d0,r0
uint32x2_t vmov_n_u32(uint32_t value); // VDUP.32 d0,r0
int8x8_t vmov_n_s8(int8_t value); // VDUP.8 d0,r0
int16x4_t vmov_n_s16(int16_t value); // VDUP.16 d0,r0
int32x2_t vmov_n_s32(int32_t value); // VDUP.32 d0,r0
poly8x8_t vmov_n_p8(poly8_t value); // VDUP.8 d0,r0
poly16x4_t vmov_n_p16(poly16_t value); // VDUP.16 d0,r0
float32x2_t vmov_n_f32(float32_t value); // VDUP.32 d0,r0
uint8x16_t vmovq_n_u8(uint8_t value); // VDUP.8 q0,r0
uint16x8_t vmovq_n_u16(uint16_t value); // VDUP.16 q0,r0
uint32x4_t vmovq_n_u32(uint32_t value); // VDUP.32 q0,r0
int8x16_t vmovq_n_s8(int8_t value); // VDUP.8 q0,r0
int16x8_t vmovq_n_s16(int16_t value); // VDUP.16 q0,r0
int32x4_t vmovq_n_s32(int32_t value); // VDUP.32 q0,r0
poly8x16_t vmovq_n_p8(poly8_t value); // VDUP.8 q0,r0
poly16x8_t vmovq_n_p16(poly16_t value); // VDUP.16 q0,r0
float32x4_t vmovq_n_f32(float32_t value); // VDUP.32 q0,r0
int64x1_t vmov_n_s64(int64_t value); // VMOV d0,r0,r0
uint64x1_t vmov_n_u64(uint64_t value); // VMOV d0,r0,r0
int64x2_t vmovq_n_s64(int64_t value); // VMOV d0,r0,r0
uint64x2_t vmovq_n_u64(uint64_t value); // VMOV d0,r0,r0
//Load all lanes of the vector to the value of a lane of a vector
uint8x8_t vdup_lane_u8(uint8x8_t vec, __constrange(0,7) int lane); // VDUP.8 d0,d0[0]
uint16x4_t vdup_lane_u16(uint16x4_t vec, __constrange(0,3) int lane); // VDUP.16 d0,d0[0]
uint32x2_t vdup_lane_u32(uint32x2_t vec, __constrange(0,1) int lane); // VDUP.32 d0,d0[0]
int8x8_t vdup_lane_s8(int8x8_t vec, __constrange(0,7) int lane); // VDUP.8 d0,d0[0]
int16x4_t vdup_lane_s16(int16x4_t vec, __constrange(0,3) int lane); // VDUP.16 d0,d0[0]
int32x2_t vdup_lane_s32(int32x2_t vec, __constrange(0,1) int lane); // VDUP.32 d0,d0[0]
poly8x8_t vdup_lane_p8(poly8x8_t vec, __constrange(0,7) int lane); // VDUP.8 d0,d0[0]
poly16x4_t vdup_lane_p16(poly16x4_t vec, __constrange(0,3) int lane); // VDUP.16 d0,d0[0]
float32x2_t vdup_lane_f32(float32x2_t vec, __constrange(0,1) int lane); // VDUP.32 d0,d0[0]
uint8x16_t vdupq_lane_u8(uint8x8_t vec, __constrange(0,7) int lane); // VDUP.8 q0,d0[0]
uint16x8_t vdupq_lane_u16(uint16x4_t vec, __constrange(0,3) int lane); // VDUP.16 q0,d0[0]
uint32x4_t vdupq_lane_u32(uint32x2_t vec, __constrange(0,1) int lane); // VDUP.32 q0,d0[0]
int8x16_t vdupq_lane_s8(int8x8_t vec, __constrange(0,7) int lane); // VDUP.8 q0,d0[0]
int16x8_t vdupq_lane_s16(int16x4_t vec, __constrange(0,3) int lane); // VDUP.16 q0,d0[0]
int32x4_t vdupq_lane_s32(int32x2_t vec, __constrange(0,1) int lane); // VDUP.32 q0,d0[0]
poly8x16_t vdupq_lane_p8(poly8x8_t vec, __constrange(0,7) int lane); // VDUP.8 q0,d0[0]
poly16x8_t vdupq_lane_p16(poly16x4_t vec, __constrange(0,3) int lane); // VDUP.16 q0,d0[0]
float32x4_t vdupq_lane_f32(float32x2_t vec, __constrange(0,1) int lane); // VDUP.32 q0,d0[0]
int64x1_t vdup_lane_s64(int64x1_t vec, __constrange(0,0) int lane); // VMOV d0,d0
uint64x1_t vdup_lane_u64(uint64x1_t vec, __constrange(0,0) int lane); // VMOV d0,d0
int64x2_t vdupq_lane_s64(int64x1_t vec, __constrange(0,0) int lane); // VMOV q0,q0
uint64x2_t vdupq_lane_u64(uint64x1_t vec, __constrange(0,0) int lane); // VMOV q0,q0
//Combining vectors. These intrinsics join two 64 bit vectors into a single 128bit vector.
int8x16_t vcombine_s8(int8x8_t low, int8x8_t high); // VMOV d0,d0
int16x8_t vcombine_s16(int16x4_t low, int16x4_t high); // VMOV d0,d0
int32x4_t vcombine_s32(int32x2_t low, int32x2_t high); // VMOV d0,d0
int64x2_t vcombine_s64(int64x1_t low, int64x1_t high); // VMOV d0,d0
float16x8_t vcombine_f16(float16x4_t low, float16x4_t high); // VMOV d0,d0
float32x4_t vcombine_f32(float32x2_t low, float32x2_t high); // VMOV d0,d0
uint8x16_t vcombine_u8(uint8x8_t low, uint8x8_t high); // VMOV d0,d0
uint16x8_t vcombine_u16(uint16x4_t low, uint16x4_t high); // VMOV d0,d0
uint32x4_t vcombine_u32(uint32x2_t low, uint32x2_t high); // VMOV d0,d0
uint64x2_t vcombine_u64(uint64x1_t low, uint64x1_t high); // VMOV d0,d0
poly8x16_t vcombine_p8(poly8x8_t low, poly8x8_t high); // VMOV d0,d0
poly16x8_t vcombine_p16(poly16x4_t low, poly16x4_t high); // VMOV d0,d0
//Splitting vectors. These intrinsics split a 128 bit vector into 2 component 64 bit vectors
int8x8_t vget_high_s8(int8x16_t a); // VMOV d0,d0
int16x4_t vget_high_s16(int16x8_t a); // VMOV d0,d0
int32x2_t vget_high_s32(int32x4_t a); // VMOV d0,d0
int64x1_t vget_high_s64(int64x2_t a); // VMOV d0,d0
float16x4_t vget_high_f16(float16x8_t a); // VMOV d0,d0
float32x2_t vget_high_f32(float32x4_t a); // VMOV d0,d0
uint8x8_t vget_high_u8(uint8x16_t a); // VMOV d0,d0
uint16x4_t vget_high_u16(uint16x8_t a); // VMOV d0,d0
uint32x2_t vget_high_u32(uint32x4_t a); // VMOV d0,d0
uint64x1_t vget_high_u64(uint64x2_t a); // VMOV d0,d0
poly8x8_t vget_high_p8(poly8x16_t a); // VMOV d0,d0
poly16x4_t vget_high_p16(poly16x8_t a); // VMOV d0,d0
int8x8_t vget_low_s8(int8x16_t a); // VMOV d0,d0
int16x4_t vget_low_s16(int16x8_t a); // VMOV d0,d0
int32x2_t vget_low_s32(int32x4_t a); // VMOV d0,d0
int64x1_t vget_low_s64(int64x2_t a); // VMOV d0,d0
float16x4_t vget_low_f16(float16x8_t a); // VMOV d0,d0
float32x2_t vget_low_f32(float32x4_t a); // VMOV d0,d0
uint8x8_t vget_low_u8(uint8x16_t a); // VMOV d0,d0
uint16x4_t vget_low_u16(uint16x8_t a); // VMOV d0,d0
uint32x2_t vget_low_u32(uint32x4_t a); // VMOV d0,d0
uint64x1_t vget_low_u64(uint64x2_t a); // VMOV d0,d0
poly8x8_t vget_low_p8(poly8x16_t a); // VMOV d0,d0
poly16x4_t vget_low_p16(poly16x8_t a); // VMOV d0,d0
//Converting vectors. These intrinsics are used to convert vectors.
//Convert from float
int32x2_t vcvt_s32_f32(float32x2_t a); // VCVT.S32.F32 d0, d0
uint32x2_t vcvt_u32_f32(float32x2_t a); // VCVT.U32.F32 d0, d0
int32x4_t vcvtq_s32_f32(float32x4_t a); // VCVT.S32.F32 q0, q0
uint32x4_t vcvtq_u32_f32(float32x4_t a); // VCVT.U32.F32 q0, q0
int32x2_t vcvt_n_s32_f32(float32x2_t a, __constrange(1,32) int b); // VCVT.S32.F32 d0, d0, #32
uint32x2_t vcvt_n_u32_f32(float32x2_t a, __constrange(1,32) int b); // VCVT.U32.F32 d0, d0, #32
int32x4_t vcvtq_n_s32_f32(float32x4_t a, __constrange(1,32) int b); // VCVT.S32.F32 q0, q0, #32
uint32x4_t vcvtq_n_u32_f32(float32x4_t a, __constrange(1,32) int b); // VCVT.U32.F32 q0, q0, #32
//Convert to float
float32x2_t vcvt_f32_s32(int32x2_t a); // VCVT.F32.S32 d0, d0
float32x2_t vcvt_f32_u32(uint32x2_t a); // VCVT.F32.U32 d0, d0
float32x4_t vcvtq_f32_s32(int32x4_t a); // VCVT.F32.S32 q0, q0
float32x4_t vcvtq_f32_u32(uint32x4_t a); // VCVT.F32.U32 q0, q0
float32x2_t vcvt_n_f32_s32(int32x2_t a, __constrange(1,32) int b); // VCVT.F32.S32 d0, d0, #32
float32x2_t vcvt_n_f32_u32(uint32x2_t a, __constrange(1,32) int b); // VCVT.F32.U32 d0, d0, #32
float32x4_t vcvtq_n_f32_s32(int32x4_t a, __constrange(1,32) int b); // VCVT.F32.S32 q0, q0, #32
float32x4_t vcvtq_n_f32_u32(uint32x4_t a, __constrange(1,32) int b); // VCVT.F32.U32 q0, q0, #32
//Convert between floats
float16x4_t vcvt_f16_f32(float32x4_t a); // VCVT.F16.F32 d0, q0
float32x4_t vcvt_f32_f16(float16x4_t a); // VCVT.F32.F16 q0, d0
//Vector narrow integer
int8x8_t vmovn_s16(int16x8_t a); // VMOVN.I16 d0,q0
int16x4_t vmovn_s32(int32x4_t a); // VMOVN.I32 d0,q0
int32x2_t vmovn_s64(int64x2_t a); // VMOVN.I64 d0,q0
uint8x8_t vmovn_u16(uint16x8_t a); // VMOVN.I16 d0,q0
uint16x4_t vmovn_u32(uint32x4_t a); // VMOVN.I32 d0,q0
uint32x2_t vmovn_u64(uint64x2_t a); // VMOVN.I64 d0,q0
//Vector long move
int16x8_t vmovl_s8(int8x8_t a); // VMOVL.S8 q0,d0
int32x4_t vmovl_s16(int16x4_t a); // VMOVL.S16 q0,d0
int64x2_t vmovl_s32(int32x2_t a); // VMOVL.S32 q0,d0
uint16x8_t vmovl_u8(uint8x8_t a); // VMOVL.U8 q0,d0
uint32x4_t vmovl_u16(uint16x4_t a); // VMOVL.U16 q0,d0
uint64x2_t vmovl_u32(uint32x2_t a); // VMOVL.U32 q0,d0
//Vector saturating narrow integer
int8x8_t vqmovn_s16(int16x8_t a); // VQMOVN.S16 d0,q0
int16x4_t vqmovn_s32(int32x4_t a); // VQMOVN.S32 d0,q0
int32x2_t vqmovn_s64(int64x2_t a); // VQMOVN.S64 d0,q0
uint8x8_t vqmovn_u16(uint16x8_t a); // VQMOVN.U16 d0,q0
uint16x4_t vqmovn_u32(uint32x4_t a); // VQMOVN.U32 d0,q0
uint32x2_t vqmovn_u64(uint64x2_t a); // VQMOVN.U64 d0,q0
//Vector saturating narrow integer signed->unsigned
uint8x8_t vqmovun_s16(int16x8_t a); // VQMOVUN.S16 d0,q0
uint16x4_t vqmovun_s32(int32x4_t a); // VQMOVUN.S32 d0,q0
uint32x2_t vqmovun_s64(int64x2_t a); // VQMOVUN.S64 d0,q0
//Table look up
uint8x8_t vtbl1_u8(uint8x8_t a, uint8x8_t b); // VTBL.8 d0, {d0}, d0
int8x8_t vtbl1_s8(int8x8_t a, int8x8_t b); // VTBL.8 d0, {d0}, d0
poly8x8_t vtbl1_p8(poly8x8_t a, uint8x8_t b); // VTBL.8 d0, {d0}, d0
uint8x8_t vtbl2_u8_ptr(uint8x8x2_t *a, uint8x8_t b); // VTBL.8 d0, {d0, d1}, d0
int8x8_t vtbl2_s8_ptr(int8x8x2_t *a, int8x8_t b); // VTBL.8 d0, {d0, d1}, d0
poly8x8_t vtbl2_p8_ptr(poly8x8x2_t *a, uint8x8_t b); // VTBL.8 d0, {d0, d1}, d0
uint8x8_t vtbl3_u8_ptr(uint8x8x3_t *a, uint8x8_t b); // VTBL.8 d0, {d0, d1, d2}, d0
int8x8_t vtbl3_s8_ptr(int8x8x3_t *a, int8x8_t b); // VTBL.8 d0, {d0, d1, d2}, d0
poly8x8_t vtbl3_p8_ptr(poly8x8x3_t *a, uint8x8_t b); // VTBL.8 d0, {d0, d1, d2}, d0
uint8x8_t vtbl4_u8_ptr(uint8x8x4_t *a, uint8x8_t b); // VTBL.8 d0, {d0, d1, d2, d3}, d0
int8x8_t vtbl4_s8_ptr(int8x8x4_t *a, int8x8_t b); // VTBL.8 d0, {d0, d1, d2, d3}, d0
poly8x8_t vtbl4_p8_ptr(poly8x8x4_t *a, uint8x8_t b); // VTBL.8 d0, {d0, d1, d2, d3}, d0
//Extended table look up intrinsics
uint8x8_t vtbx1_u8(uint8x8_t a, uint8x8_t b, uint8x8_t c); // VTBX.8 d0, {d0}, d0
int8x8_t vtbx1_s8(int8x8_t a, int8x8_t b, int8x8_t c); // VTBX.8 d0, {d0}, d0
poly8x8_t vtbx1_p8(poly8x8_t a, poly8x8_t b, uint8x8_t c); // VTBX.8 d0, {d0}, d0
uint8x8_t vtbx2_u8_ptr(uint8x8_t a, uint8x8x2_t *b, uint8x8_t c); // VTBX.8 d0, {d0, d1}, d0
int8x8_t vtbx2_s8_ptr(int8x8_t a, int8x8x2_t *b, int8x8_t c); // VTBX.8 d0, {d0, d1}, d0
poly8x8_t vtbx2_p8_ptr(poly8x8_t a, poly8x8x2_t *b, uint8x8_t c); // VTBX.8 d0, {d0, d1}, d0
uint8x8_t vtbx3_u8_ptr(uint8x8_t a, uint8x8x3_t *b, uint8x8_t c); // VTBX.8 d0, {d0, d1, d2}, d0
int8x8_t vtbx3_s8_ptr(int8x8_t a, int8x8x3_t *b, int8x8_t c); // VTBX.8 d0, {d0, d1, d2}, d0
poly8x8_t vtbx3_p8_ptr(poly8x8_t a, poly8x8x3_t *b, uint8x8_t c); // VTBX.8 d0, {d0, d1, d2}, d0
uint8x8_t vtbx4_u8_ptr(uint8x8_t a, uint8x8x4_t *b, uint8x8_t c); // VTBX.8 d0, {d0, d1, d2, d3}, d0
int8x8_t vtbx4_s8_ptr(int8x8_t a, int8x8x4_t *b, int8x8_t c); // VTBX.8 d0, {d0, d1, d2, d3}, d0
poly8x8_t vtbx4_p8_ptr(poly8x8_t a, poly8x8x4_t *b, uint8x8_t c); // VTBX.8 d0, {d0, d1, d2, d3}, d0
//Operations with a scalar value
//Vector multiply accumulate with scalar
int16x4_t vmla_lane_s16(int16x4_t a, int16x4_t b, int16x4_t v, __constrange(0,3) int l); // VMLA.I16 d0, d0,d0[0]
int32x2_t vmla_lane_s32(int32x2_t a, int32x2_t b, int32x2_t v, __constrange(0,1) int l); // VMLA.I32 d0, d0,d0[0]
uint16x4_t vmla_lane_u16(uint16x4_t a, uint16x4_t b, uint16x4_t v, __constrange(0,3) int l); // VMLA.I16 d0, d0,d0[0]
uint32x2_t vmla_lane_u32(uint32x2_t a, uint32x2_t b, uint32x2_t v, __constrange(0,1) int l); // VMLA.I32 d0, d0,d0[0]
float32x2_t vmla_lane_f32(float32x2_t a, float32x2_t b, float32x2_t v, __constrange(0,1) int l); // VMLA.F32 d0,d0, d0[0]
int16x8_t vmlaq_lane_s16(int16x8_t a, int16x8_t b, int16x4_t v, __constrange(0,3) int l); // VMLA.I16 q0, q0,d0[0]
int32x4_t vmlaq_lane_s32(int32x4_t a, int32x4_t b, int32x2_t v, __constrange(0,1) int l); // VMLA.I32 q0, q0,d0[0]
uint16x8_t vmlaq_lane_u16(uint16x8_t a, uint16x8_t b, uint16x4_t v, __constrange(0,3) int l); // VMLA.I16 q0,q0, d0[0]
uint32x4_t vmlaq_lane_u32(uint32x4_t a, uint32x4_t b, uint32x2_t v, __constrange(0,1) int l); // VMLA.I32 q0,q0, d0[0]
float32x4_t vmlaq_lane_f32(float32x4_t a, float32x4_t b, float32x2_t v, __constrange(0,1) int l); // VMLA.F32 q0,q0, d0[0]
//Vector widening multiply accumulate with scalar
int32x4_t vmlal_lane_s16(int32x4_t a, int16x4_t b, int16x4_t v, __constrange(0,3) int l); //VMLAL.S16 q0, d0,d0[0]
int64x2_t vmlal_lane_s32(int64x2_t a, int32x2_t b, int32x2_t v, __constrange(0,1) int l); //VMLAL.S32 q0, d0,d0[0]
uint32x4_t vmlal_lane_u16(uint32x4_t a, uint16x4_t b, uint16x4_t v, __constrange(0,3) int l); // VMLAL.U16 q0,d0, d0[0]
uint64x2_t vmlal_lane_u32(uint64x2_t a, uint32x2_t b, uint32x2_t v, __constrange(0,1) int l); // VMLAL.U32 q0,d0, d0[0]
//Vector widening saturating doubling multiply accumulate with scalar
int32x4_t vqdmlal_lane_s16(int32x4_t a, int16x4_t b, int16x4_t v, __constrange(0,3) int l); // VQDMLAL.S16 q0,d0, d0[0]
int64x2_t vqdmlal_lane_s32(int64x2_t a, int32x2_t b, int32x2_t v, __constrange(0,1) int l); // VQDMLAL.S32 q0,d0, d0[0]
//Vector multiply subtract with scalar
int16x4_t vmls_lane_s16(int16x4_t a, int16x4_t b, int16x4_t v, __constrange(0,3) int l); // VMLS.I16 d0, d0,d0[0]
int32x2_t vmls_lane_s32(int32x2_t a, int32x2_t b, int32x2_t v, __constrange(0,1) int l); // VMLS.I32 d0, d0,d0[0]
uint16x4_t vmls_lane_u16(uint16x4_t a, uint16x4_t b, uint16x4_t v, __constrange(0,3) int l); // VMLS.I16 d0, d0,d0[0]
uint32x2_t vmls_lane_u32(uint32x2_t a, uint32x2_t b, uint32x2_t v, __constrange(0,1) int l); // VMLS.I32 d0, d0,d0[0]
float32x2_t vmls_lane_f32(float32x2_t a, float32x2_t b, float32x2_t v, __constrange(0,1) int l); // VMLS.F32 d0,d0, d0[0]
int16x8_t vmlsq_lane_s16(int16x8_t a, int16x8_t b, int16x4_t v, __constrange(0,3) int l); // VMLS.I16 q0, q0,d0[0]
int32x4_t vmlsq_lane_s32(int32x4_t a, int32x4_t b, int32x2_t v, __constrange(0,1) int l); // VMLS.I32 q0, q0,d0[0]
uint16x8_t vmlsq_lane_u16(uint16x8_t a, uint16x8_t b, uint16x4_t v, __constrange(0,3) int l); // VMLS.I16 q0,q0, d0[0]
uint32x4_t vmlsq_lane_u32(uint32x4_t a, uint32x4_t b, uint32x2_t v, __constrange(0,1) int l); // VMLS.I32 q0,q0, d0[0]
float32x4_t vmlsq_lane_f32(float32x4_t a, float32x4_t b, float32x2_t v, __constrange(0,1) int l); // VMLS.F32 q0,q0, d0[0]
//Vector widening multiply subtract with scalar
int32x4_t vmlsl_lane_s16(int32x4_t a, int16x4_t b, int16x4_t v, __constrange(0,3) int l); // VMLSL.S16 q0, d0,d0[0]
int64x2_t vmlsl_lane_s32(int64x2_t a, int32x2_t b, int32x2_t v, __constrange(0,1) int l); // VMLSL.S32 q0, d0,d0[0]
uint32x4_t vmlsl_lane_u16(uint32x4_t a, uint16x4_t b, uint16x4_t v, __constrange(0,3) int l); // VMLSL.U16 q0,d0, d0[0]
uint64x2_t vmlsl_lane_u32(uint64x2_t a, uint32x2_t b, uint32x2_t v, __constrange(0,1) int l); // VMLSL.U32 q0,d0, d0[0]
//Vector widening saturating doubling multiply subtract with scalar
int32x4_t vqdmlsl_lane_s16(int32x4_t a, int16x4_t b, int16x4_t v, __constrange(0,3) int l); // VQDMLSL.S16 q0,d0, d0[0]
int64x2_t vqdmlsl_lane_s32(int64x2_t a, int32x2_t b, int32x2_t v, __constrange(0,1) int l); // VQDMLSL.S32 q0,d0, d0[0]
//Vector multiply by scalar
int16x4_t vmul_n_s16(int16x4_t a, int16_t b); // VMUL.I16 d0,d0,d0[0]
int32x2_t vmul_n_s32(int32x2_t a, int32_t b); // VMUL.I32 d0,d0,d0[0]
float32x2_t vmul_n_f32(float32x2_t a, float32_t b); // VMUL.F32 d0,d0,d0[0]
uint16x4_t vmul_n_u16(uint16x4_t a, uint16_t b); // VMUL.I16 d0,d0,d0[0]
uint32x2_t vmul_n_u32(uint32x2_t a, uint32_t b); // VMUL.I32 d0,d0,d0[0]
int16x8_t vmulq_n_s16(int16x8_t a, int16_t b); // VMUL.I16 q0,q0,d0[0]
int32x4_t vmulq_n_s32(int32x4_t a, int32_t b); // VMUL.I32 q0,q0,d0[0]
float32x4_t vmulq_n_f32(float32x4_t a, float32_t b); // VMUL.F32 q0,q0,d0[0]
uint16x8_t vmulq_n_u16(uint16x8_t a, uint16_t b); // VMUL.I16 q0,q0,d0[0]
uint32x4_t vmulq_n_u32(uint32x4_t a, uint32_t b); // VMUL.I32 q0,q0,d0[0]
//Vector long multiply with scalar
int32x4_t vmull_n_s16(int16x4_t vec1, int16_t val2); // VMULL.S16 q0,d0,d0[0]
int64x2_t vmull_n_s32(int32x2_t vec1, int32_t val2); // VMULL.S32 q0,d0,d0[0]
uint32x4_t vmull_n_u16(uint16x4_t vec1, uint16_t val2); // VMULL.U16 q0,d0,d0[0]
uint64x2_t vmull_n_u32(uint32x2_t vec1, uint32_t val2); // VMULL.U32 q0,d0,d0[0]
//Vector long multiply by scalar
int32x4_t vmull_lane_s16(int16x4_t vec1, int16x4_t val2, __constrange(0, 3) int val3); // VMULL.S16 q0,d0,d0[0]
int64x2_t vmull_lane_s32(int32x2_t vec1, int32x2_t val2, __constrange(0, 1) int val3); // VMULL.S32 q0,d0,d0[0]
uint32x4_t vmull_lane_u16(uint16x4_t vec1, uint16x4_t val2, __constrange(0, 3) int val3); // VMULL.U16 q0,d0,d0[0]
uint64x2_t vmull_lane_u32(uint32x2_t vec1, uint32x2_t val2, __constrange(0, 1) int val3); // VMULL.U32 q0,d0,d0[0]
//Vector saturating doubling long multiply with scalar
int32x4_t vqdmull_n_s16(int16x4_t vec1, int16_t val2); // VQDMULL.S16 q0,d0,d0[0]
int64x2_t vqdmull_n_s32(int32x2_t vec1, int32_t val2); // VQDMULL.S32 q0,d0,d0[0]
//Vector saturating doubling long multiply by scalar
int32x4_t vqdmull_lane_s16(int16x4_t vec1, int16x4_t val2, __constrange(0, 3) int val3); // VQDMULL.S16 q0,d0,d0[0]
int64x2_t vqdmull_lane_s32(int32x2_t vec1, int32x2_t val2, __constrange(0, 1) int val3); // VQDMULL.S32 q0,d0,d0[0]
//Vector saturating doubling multiply high with scalar
int16x4_t vqdmulh_n_s16(int16x4_t vec1, int16_t val2); // VQDMULH.S16 d0,d0,d0[0]
int32x2_t vqdmulh_n_s32(int32x2_t vec1, int32_t val2); // VQDMULH.S32 d0,d0,d0[0]
int16x8_t vqdmulhq_n_s16(int16x8_t vec1, int16_t val2); // VQDMULH.S16 q0,q0,d0[0]
int32x4_t vqdmulhq_n_s32(int32x4_t vec1, int32_t val2); // VQDMULH.S32 q0,q0,d0[0]
//Vector saturating doubling multiply high by scalar
int16x4_t vqdmulh_lane_s16(int16x4_t vec1, int16x4_t val2, __constrange(0, 3) int val3); // VQDMULH.S16 d0,d0,d0[0]
int32x2_t vqdmulh_lane_s32(int32x2_t vec1, int32x2_t val2, __constrange(0, 1) int val3); // VQDMULH.S32 d0,d0,d0[0]
int16x8_t vqdmulhq_lane_s16(int16x8_t vec1, int16x4_t val2, __constrange(0, 3) int val3); // VQDMULH.S16 q0,q0,d0[0]
int32x4_t vqdmulhq_lane_s32(int32x4_t vec1, int32x2_t val2, __constrange(0, 1) int val3); // VQDMULH.S32 q0,q0,d0[0]
//Vector saturating rounding doubling multiply high with scalar
int16x4_t vqrdmulh_n_s16(int16x4_t vec1, int16_t val2); // VQRDMULH.S16 d0,d0,d0[0]
int32x2_t vqrdmulh_n_s32(int32x2_t vec1, int32_t val2); // VQRDMULH.S32 d0,d0,d0[0]
int16x8_t vqrdmulhq_n_s16(int16x8_t vec1, int16_t val2); // VQRDMULH.S16 q0,q0,d0[0]
int32x4_t vqrdmulhq_n_s32(int32x4_t vec1, int32_t val2); // VQRDMULH.S32 q0,q0,d0[0]
//Vector rounding saturating doubling multiply high by scalar
int16x4_t vqrdmulh_lane_s16(int16x4_t vec1, int16x4_t val2, __constrange(0, 3) int val3); // VQRDMULH.S16 d0,d0,d0[0]
int32x2_t vqrdmulh_lane_s32(int32x2_t vec1, int32x2_t val2, __constrange(0, 1) int val3); // VQRDMULH.S32 d0,d0,d0[0]
int16x8_t vqrdmulhq_lane_s16(int16x8_t vec1, int16x4_t val2, __constrange(0, 3) int val3); // VQRDMULH.S16 q0,q0,d0[0]
int32x4_t vqrdmulhq_lane_s32(int32x4_t vec1, int32x2_t val2, __constrange(0, 1) int val3); // VQRDMULH.S32 q0,q0,d0[0]
//Vector multiply accumulate with scalar
int16x4_t vmla_n_s16(int16x4_t a, int16x4_t b, int16_t c); // VMLA.I16 d0, d0, d0[0]
int32x2_t vmla_n_s32(int32x2_t a, int32x2_t b, int32_t c); // VMLA.I32 d0, d0, d0[0]
uint16x4_t vmla_n_u16(uint16x4_t a, uint16x4_t b, uint16_t c); // VMLA.I16 d0, d0, d0[0]
uint32x2_t vmla_n_u32(uint32x2_t a, uint32x2_t b, uint32_t c); // VMLA.I32 d0, d0, d0[0]
float32x2_t vmla_n_f32(float32x2_t a, float32x2_t b, float32_t c); // VMLA.F32 d0, d0, d0[0]
int16x8_t vmlaq_n_s16(int16x8_t a, int16x8_t b, int16_t c); // VMLA.I16 q0, q0, d0[0]
int32x4_t vmlaq_n_s32(int32x4_t a, int32x4_t b, int32_t c); // VMLA.I32 q0, q0, d0[0]
uint16x8_t vmlaq_n_u16(uint16x8_t a, uint16x8_t b, uint16_t c); // VMLA.I16 q0, q0, d0[0]
uint32x4_t vmlaq_n_u32(uint32x4_t a, uint32x4_t b, uint32_t c); // VMLA.I32 q0, q0, d0[0]
float32x4_t vmlaq_n_f32(float32x4_t a, float32x4_t b, float32_t c); // VMLA.F32 q0, q0, d0[0]
//Vector widening multiply accumulate with scalar
int32x4_t vmlal_n_s16(int32x4_t a, int16x4_t b, int16_t c); // VMLAL.S16 q0, d0, d0[0]
int64x2_t vmlal_n_s32(int64x2_t a, int32x2_t b, int32_t c); // VMLAL.S32 q0, d0, d0[0]
uint32x4_t vmlal_n_u16(uint32x4_t a, uint16x4_t b, uint16_t c); // VMLAL.U16 q0, d0, d0[0]
uint64x2_t vmlal_n_u32(uint64x2_t a, uint32x2_t b, uint32_t c); // VMLAL.U32 q0, d0, d0[0]
//Vector widening saturating doubling multiply accumulate with scalar
int32x4_t vqdmlal_n_s16(int32x4_t a, int16x4_t b, int16_t c); // VQDMLAL.S16 q0, d0, d0[0]
int64x2_t vqdmlal_n_s32(int64x2_t a, int32x2_t b, int32_t c); // VQDMLAL.S32 q0, d0, d0[0]
//Vector multiply subtract with scalar
int16x4_t vmls_n_s16(int16x4_t a, int16x4_t b, int16_t c); // VMLS.I16 d0, d0, d0[0]
int32x2_t vmls_n_s32(int32x2_t a, int32x2_t b, int32_t c); // VMLS.I32 d0, d0, d0[0]
uint16x4_t vmls_n_u16(uint16x4_t a, uint16x4_t b, uint16_t c); // VMLS.I16 d0, d0, d0[0]
uint32x2_t vmls_n_u32(uint32x2_t a, uint32x2_t b, uint32_t c); // VMLS.I32 d0, d0, d0[0]
float32x2_t vmls_n_f32(float32x2_t a, float32x2_t b, float32_t c); // VMLS.F32 d0, d0, d0[0]
int16x8_t vmlsq_n_s16(int16x8_t a, int16x8_t b, int16_t c); // VMLS.I16 q0, q0, d0[0]
int32x4_t vmlsq_n_s32(int32x4_t a, int32x4_t b, int32_t c); // VMLS.I32 q0, q0, d0[0]
uint16x8_t vmlsq_n_u16(uint16x8_t a, uint16x8_t b, uint16_t c); // VMLS.I16 q0, q0, d0[0]
uint32x4_t vmlsq_n_u32(uint32x4_t a, uint32x4_t b, uint32_t c); // VMLS.I32 q0, q0, d0[0]
float32x4_t vmlsq_n_f32(float32x4_t a, float32x4_t b, float32_t c); // VMLS.F32 q0, q0, d0[0]
//Vector widening multiply subtract with scalar
int32x4_t vmlsl_n_s16(int32x4_t a, int16x4_t b, int16_t c); // VMLSL.S16 q0, d0, d0[0]
int64x2_t vmlsl_n_s32(int64x2_t a, int32x2_t b, int32_t c); // VMLSL.S32 q0, d0, d0[0]
uint32x4_t vmlsl_n_u16(uint32x4_t a, uint16x4_t b, uint16_t c); // VMLSL.U16 q0, d0, d0[0]
uint64x2_t vmlsl_n_u32(uint64x2_t a, uint32x2_t b, uint32_t c); // VMLSL.U32 q0, d0, d0[0]
//Vector widening saturating doubling multiply subtract with scalar
int32x4_t vqdmlsl_n_s16(int32x4_t a, int16x4_t b, int16_t c); // VQDMLSL.S16 q0, d0, d0[0]
int64x2_t vqdmlsl_n_s32(int64x2_t a, int32x2_t b, int32_t c); // VQDMLSL.S32 q0, d0, d0[0]
//Vector extract
int8x8_t vext_s8(int8x8_t a, int8x8_t b, __constrange(0,7) int c); // VEXT.8 d0,d0,d0,#0
uint8x8_t vext_u8(uint8x8_t a, uint8x8_t b, __constrange(0,7) int c); // VEXT.8 d0,d0,d0,#0
poly8x8_t vext_p8(poly8x8_t a, poly8x8_t b, __constrange(0,7) int c); // VEXT.8 d0,d0,d0,#0
int16x4_t vext_s16(int16x4_t a, int16x4_t b, __constrange(0,3) int c); // VEXT.16 d0,d0,d0,#0
uint16x4_t vext_u16(uint16x4_t a, uint16x4_t b, __constrange(0,3) int c); // VEXT.16 d0,d0,d0,#0
poly16x4_t vext_p16(poly16x4_t a, poly16x4_t b, __constrange(0,3) int c); // VEXT.16 d0,d0,d0,#0
int32x2_t vext_s32(int32x2_t a, int32x2_t b, __constrange(0,1) int c); // VEXT.32 d0,d0,d0,#0
uint32x2_t vext_u32(uint32x2_t a, uint32x2_t b, __constrange(0,1) int c); // VEXT.32 d0,d0,d0,#0
int64x1_t vext_s64(int64x1_t a, int64x1_t b, __constrange(0,0) int c); // VEXT.64 d0,d0,d0,#0
uint64x1_t vext_u64(uint64x1_t a, uint64x1_t b, __constrange(0,0) int c); // VEXT.64 d0,d0,d0,#0
float32x2_t vext_f32(float32x2_t a, float32x2_t b, __constrange(0,1) int c); // VEXT.32 d0,d0,d0,#0
int8x16_t vextq_s8(int8x16_t a, int8x16_t b, __constrange(0,15) int c); // VEXT.8 q0,q0,q0,#0
uint8x16_t vextq_u8(uint8x16_t a, uint8x16_t b, __constrange(0,15) int c); // VEXT.8 q0,q0,q0,#0
poly8x16_t vextq_p8(poly8x16_t a, poly8x16_t b, __constrange(0,15) int c); // VEXT.8 q0,q0,q0,#0
int16x8_t vextq_s16(int16x8_t a, int16x8_t b, __constrange(0,7) int c); // VEXT.16 q0,q0,q0,#0
uint16x8_t vextq_u16(uint16x8_t a, uint16x8_t b, __constrange(0,7) int c); // VEXT.16 q0,q0,q0,#0
poly16x8_t vextq_p16(poly16x8_t a, poly16x8_t b, __constrange(0,7) int c); // VEXT.16 q0,q0,q0,#0
int32x4_t vextq_s32(int32x4_t a, int32x4_t b, __constrange(0,3) int c); // VEXT.32 q0,q0,q0,#0
uint32x4_t vextq_u32(uint32x4_t a, uint32x4_t b, __constrange(0,3) int c); // VEXT.32 q0,q0,q0,#0
int64x2_t vextq_s64(int64x2_t a, int64x2_t b, __constrange(0,1) int c); // VEXT.64 q0,q0,q0,#0
uint64x2_t vextq_u64(uint64x2_t a, uint64x2_t b, __constrange(0,1) int c); // VEXT.64 q0,q0,q0,#0
float32x4_t vextq_f32(float32x4_t a, float32x4_t b, __constrange(0,3) float c); // VEXT.32 q0,q0,q0,#0
//Reverse vector elements (swap endianness). VREVn.m reverses the order of the m-bit lanes within a set that is n bits wide.
int8x8_t vrev64_s8(int8x8_t vec); // VREV64.8 d0,d0
int16x4_t vrev64_s16(int16x4_t vec); // VREV64.16 d0,d0
int32x2_t vrev64_s32(int32x2_t vec); // VREV64.32 d0,d0
uint8x8_t vrev64_u8(uint8x8_t vec); // VREV64.8 d0,d0
uint16x4_t vrev64_u16(uint16x4_t vec); // VREV64.16 d0,d0
uint32x2_t vrev64_u32(uint32x2_t vec); // VREV64.32 d0,d0
poly8x8_t vrev64_p8(poly8x8_t vec); // VREV64.8 d0,d0
poly16x4_t vrev64_p16(poly16x4_t vec); // VREV64.16 d0,d0
float32x2_t vrev64_f32(float32x2_t vec); // VREV64.32 d0,d0
int8x16_t vrev64q_s8(int8x16_t vec); // VREV64.8 q0,q0
int16x8_t vrev64q_s16(int16x8_t vec); // VREV64.16 q0,q0
int32x4_t vrev64q_s32(int32x4_t vec); // VREV64.32 q0,q0
uint8x16_t vrev64q_u8(uint8x16_t vec); // VREV64.8 q0,q0
uint16x8_t vrev64q_u16(uint16x8_t vec); // VREV64.16 q0,q0
uint32x4_t vrev64q_u32(uint32x4_t vec); // VREV64.32 q0,q0
poly8x16_t vrev64q_p8(poly8x16_t vec); // VREV64.8 q0,q0
poly16x8_t vrev64q_p16(poly16x8_t vec); // VREV64.16 q0,q0
float32x4_t vrev64q_f32(float32x4_t vec); // VREV64.32 q0,q0
int8x8_t vrev32_s8(int8x8_t vec); // VREV32.8 d0,d0
int16x4_t vrev32_s16(int16x4_t vec); // VREV32.16 d0,d0
uint8x8_t vrev32_u8(uint8x8_t vec); // VREV32.8 d0,d0
uint16x4_t vrev32_u16(uint16x4_t vec); // VREV32.16 d0,d0
poly8x8_t vrev32_p8(poly8x8_t vec); // VREV32.8 d0,d0
poly16x4_t vrev32_p16(poly16x4_t vec); // VREV32.16 d0,d0
int8x16_t vrev32q_s8(int8x16_t vec); // VREV32.8 q0,q0
int16x8_t vrev32q_s16(int16x8_t vec); // VREV32.16 q0,q0
uint8x16_t vrev32q_u8(uint8x16_t vec); // VREV32.8 q0,q0
uint16x8_t vrev32q_u16(uint16x8_t vec); // VREV32.16 q0,q0
poly8x16_t vrev32q_p8(poly8x16_t vec); // VREV32.8 q0,q0
poly16x8_t vrev32q_p16(poly16x8_t vec); // VREV32.16 q0,q0
int8x8_t vrev16_s8(int8x8_t vec); // VREV16.8 d0,d0
uint8x8_t vrev16_u8(uint8x8_t vec); // VREV16.8 d0,d0
poly8x8_t vrev16_p8(poly8x8_t vec); // VREV16.8 d0,d0
int8x16_t vrev16q_s8(int8x16_t vec); // VREV16.8 q0,q0
uint8x16_t vrev16q_u8(uint8x16_t vec); // VREV16.8 q0,q0
poly8x16_t vrev16q_p8(poly8x16_t vec); // VREV16.8 q0,q0
//Other single operand arithmetic
//Absolute: Vd[i] = |Va[i]|
int8x8_t vabs_s8(int8x8_t a); // VABS.S8 d0,d0
int16x4_t vabs_s16(int16x4_t a); // VABS.S16 d0,d0
int32x2_t vabs_s32(int32x2_t a); // VABS.S32 d0,d0
float32x2_t vabs_f32(float32x2_t a); // VABS.F32 d0,d0
int8x16_t vabsq_s8(int8x16_t a); // VABS.S8 q0,q0
int16x8_t vabsq_s16(int16x8_t a); // VABS.S16 q0,q0
int32x4_t vabsq_s32(int32x4_t a); // VABS.S32 q0,q0
float32x4_t vabsq_f32(float32x4_t a); // VABS.F32 q0,q0
//Saturating absolute: Vd[i] = sat(|Va[i]|)
int8x8_t vqabs_s8(int8x8_t a); // VQABS.S8 d0,d0
int16x4_t vqabs_s16(int16x4_t a); // VQABS.S16 d0,d0
int32x2_t vqabs_s32(int32x2_t a); // VQABS.S32 d0,d0
int8x16_t vqabsq_s8(int8x16_t a); // VQABS.S8 q0,q0
int16x8_t vqabsq_s16(int16x8_t a); // VQABS.S16 q0,q0
int32x4_t vqabsq_s32(int32x4_t a); // VQABS.S32 q0,q0
//Negate: Vd[i] = - Va[i]
int8x8_t vneg_s8(int8x8_t a); // VNE//d0,d0
int16x4_t vneg_s16(int16x4_t a); // VNE//d0,d0
int32x2_t vneg_s32(int32x2_t a); // VNE//d0,d0
float32x2_t vneg_f32(float32x2_t a); // VNE//d0,d0
int8x16_t vnegq_s8(int8x16_t a); // VNE//q0,q0
int16x8_t vnegq_s16(int16x8_t a); // VNE//q0,q0
int32x4_t vnegq_s32(int32x4_t a); // VNE//q0,q0
float32x4_t vnegq_f32(float32x4_t a); // VNE//q0,q0
//Saturating Negate: sat(Vd[i] = - Va[i])
int8x8_t vqneg_s8(int8x8_t a); // VQNE//d0,d0
int16x4_t vqneg_s16(int16x4_t a); // VQNE//d0,d0
int32x2_t vqneg_s32(int32x2_t a); // VQNE//d0,d0
int8x16_t vqnegq_s8(int8x16_t a); // VQNE//q0,q0
int16x8_t vqnegq_s16(int16x8_t a); // VQNE//q0,q0
int32x4_t vqnegq_s32(int32x4_t a); // VQNE//q0,q0
//Count leading sign bits
int8x8_t vcls_s8(int8x8_t a); // VCLS.S8 d0,d0
int16x4_t vcls_s16(int16x4_t a); // VCLS.S16 d0,d0
int32x2_t vcls_s32(int32x2_t a); // VCLS.S32 d0,d0
int8x16_t vclsq_s8(int8x16_t a); // VCLS.S8 q0,q0
int16x8_t vclsq_s16(int16x8_t a); // VCLS.S16 q0,q0
int32x4_t vclsq_s32(int32x4_t a); // VCLS.S32 q0,q0
//Count leading zeros
int8x8_t vclz_s8(int8x8_t a); // VCLZ.I8 d0,d0
int16x4_t vclz_s16(int16x4_t a); // VCLZ.I16 d0,d0
int32x2_t vclz_s32(int32x2_t a); // VCLZ.I32 d0,d0
uint8x8_t vclz_u8(uint8x8_t a); // VCLZ.I8 d0,d0
uint16x4_t vclz_u16(uint16x4_t a); // VCLZ.I16 d0,d0
uint32x2_t vclz_u32(uint32x2_t a); // VCLZ.I32 d0,d0
int8x16_t vclzq_s8(int8x16_t a); // VCLZ.I8 q0,q0
int16x8_t vclzq_s16(int16x8_t a); // VCLZ.I16 q0,q0
int32x4_t vclzq_s32(int32x4_t a); // VCLZ.I32 q0,q0
uint8x16_t vclzq_u8(uint8x16_t a); // VCLZ.I8 q0,q0
uint16x8_t vclzq_u16(uint16x8_t a); // VCLZ.I16 q0,q0
uint32x4_t vclzq_u32(uint32x4_t a); // VCLZ.I32 q0,q0
//Count number of set bits
uint8x8_t vcnt_u8(uint8x8_t a); // VCNT.8 d0,d0
int8x8_t vcnt_s8(int8x8_t a); // VCNT.8 d0,d0
poly8x8_t vcnt_p8(poly8x8_t a); // VCNT.8 d0,d0
uint8x16_t vcntq_u8(uint8x16_t a); // VCNT.8 q0,q0
int8x16_t vcntq_s8(int8x16_t a); // VCNT.8 q0,q0
poly8x16_t vcntq_p8(poly8x16_t a); // VCNT.8 q0,q0
//Reciprocal estimate
float32x2_t vrecpe_f32(float32x2_t a); // VRECPE.F32 d0,d0
uint32x2_t vrecpe_u32(uint32x2_t a); // VRECPE.U32 d0,d0
float32x4_t vrecpeq_f32(float32x4_t a); // VRECPE.F32 q0,q0
uint32x4_t vrecpeq_u32(uint32x4_t a); // VRECPE.U32 q0,q0
//Reciprocal square root estimate
float32x2_t vrsqrte_f32(float32x2_t a); // VRSQRTE.F32 d0,d0
uint32x2_t vrsqrte_u32(uint32x2_t a); // VRSQRTE.U32 d0,d0
float32x4_t vrsqrteq_f32(float32x4_t a); // VRSQRTE.F32 q0,q0
uint32x4_t vrsqrteq_u32(uint32x4_t a); // VRSQRTE.U32 q0,q0
//Logical operations
//Bitwise not
int8x8_t vmvn_s8(int8x8_t a); // VMVN d0,d0
int16x4_t vmvn_s16(int16x4_t a); // VMVN d0,d0
int32x2_t vmvn_s32(int32x2_t a); // VMVN d0,d0
uint8x8_t vmvn_u8(uint8x8_t a); // VMVN d0,d0
uint16x4_t vmvn_u16(uint16x4_t a); // VMVN d0,d0
uint32x2_t vmvn_u32(uint32x2_t a); // VMVN d0,d0
poly8x8_t vmvn_p8(poly8x8_t a); // VMVN d0,d0
int8x16_t vmvnq_s8(int8x16_t a); // VMVN q0,q0
int16x8_t vmvnq_s16(int16x8_t a); // VMVN q0,q0
int32x4_t vmvnq_s32(int32x4_t a); // VMVN q0,q0
uint8x16_t vmvnq_u8(uint8x16_t a); // VMVN q0,q0
uint16x8_t vmvnq_u16(uint16x8_t a); // VMVN q0,q0
uint32x4_t vmvnq_u32(uint32x4_t a); // VMVN q0,q0
poly8x16_t vmvnq_p8(poly8x16_t a); // VMVN q0,q0
//Bitwise and
int8x8_t vand_s8(int8x8_t a, int8x8_t b); // VAND d0,d0,d0
int16x4_t vand_s16(int16x4_t a, int16x4_t b); // VAND d0,d0,d0
int32x2_t vand_s32(int32x2_t a, int32x2_t b); // VAND d0,d0,d0
int64x1_t vand_s64(int64x1_t a, int64x1_t b); // VAND d0,d0,d0
uint8x8_t vand_u8(uint8x8_t a, uint8x8_t b); // VAND d0,d0,d0
uint16x4_t vand_u16(uint16x4_t a, uint16x4_t b); // VAND d0,d0,d0
uint32x2_t vand_u32(uint32x2_t a, uint32x2_t b); // VAND d0,d0,d0
uint64x1_t vand_u64(uint64x1_t a, uint64x1_t b); // VAND d0,d0,d0
int8x16_t vandq_s8(int8x16_t a, int8x16_t b); // VAND q0,q0,q0
int16x8_t vandq_s16(int16x8_t a, int16x8_t b); // VAND q0,q0,q0
int32x4_t vandq_s32(int32x4_t a, int32x4_t b); // VAND q0,q0,q0
int64x2_t vandq_s64(int64x2_t a, int64x2_t b); // VAND q0,q0,q0
uint8x16_t vandq_u8(uint8x16_t a, uint8x16_t b); // VAND q0,q0,q0
uint16x8_t vandq_u16(uint16x8_t a, uint16x8_t b); // VAND q0,q0,q0
uint32x4_t vandq_u32(uint32x4_t a, uint32x4_t b); // VAND q0,q0,q0
uint64x2_t vandq_u64(uint64x2_t a, uint64x2_t b); // VAND q0,q0,q0
//Bitwise or
int8x8_t vorr_s8(int8x8_t a, int8x8_t b); // VORR d0,d0,d0
int16x4_t vorr_s16(int16x4_t a, int16x4_t b); // VORR d0,d0,d0
int32x2_t vorr_s32(int32x2_t a, int32x2_t b); // VORR d0,d0,d0
int64x1_t vorr_s64(int64x1_t a, int64x1_t b); // VORR d0,d0,d0
uint8x8_t vorr_u8(uint8x8_t a, uint8x8_t b); // VORR d0,d0,d0
uint16x4_t vorr_u16(uint16x4_t a, uint16x4_t b); // VORR d0,d0,d0
uint32x2_t vorr_u32(uint32x2_t a, uint32x2_t b); // VORR d0,d0,d0
uint64x1_t vorr_u64(uint64x1_t a, uint64x1_t b); // VORR d0,d0,d0
int8x16_t vorrq_s8(int8x16_t a, int8x16_t b); // VORR q0,q0,q0
int16x8_t vorrq_s16(int16x8_t a, int16x8_t b); // VORR q0,q0,q0
int32x4_t vorrq_s32(int32x4_t a, int32x4_t b); // VORR q0,q0,q0
int64x2_t vorrq_s64(int64x2_t a, int64x2_t b); // VORR q0,q0,q0
uint8x16_t vorrq_u8(uint8x16_t a, uint8x16_t b); // VORR q0,q0,q0
uint16x8_t vorrq_u16(uint16x8_t a, uint16x8_t b); // VORR q0,q0,q0
uint32x4_t vorrq_u32(uint32x4_t a, uint32x4_t b); // VORR q0,q0,q0
uint64x2_t vorrq_u64(uint64x2_t a, uint64x2_t b); // VORR q0,q0,q0
//Bitwise exclusive or (EOR or XOR)
int8x8_t veor_s8(int8x8_t a, int8x8_t b); // VEOR d0,d0,d0
int16x4_t veor_s16(int16x4_t a, int16x4_t b); // VEOR d0,d0,d0
int32x2_t veor_s32(int32x2_t a, int32x2_t b); // VEOR d0,d0,d0
int64x1_t veor_s64(int64x1_t a, int64x1_t b); // VEOR d0,d0,d0
uint8x8_t veor_u8(uint8x8_t a, uint8x8_t b); // VEOR d0,d0,d0
uint16x4_t veor_u16(uint16x4_t a, uint16x4_t b); // VEOR d0,d0,d0
uint32x2_t veor_u32(uint32x2_t a, uint32x2_t b); // VEOR d0,d0,d0
uint64x1_t veor_u64(uint64x1_t a, uint64x1_t b); // VEOR d0,d0,d0
int8x16_t veorq_s8(int8x16_t a, int8x16_t b); // VEOR q0,q0,q0
int16x8_t veorq_s16(int16x8_t a, int16x8_t b); // VEOR q0,q0,q0
int32x4_t veorq_s32(int32x4_t a, int32x4_t b); // VEOR q0,q0,q0
int64x2_t veorq_s64(int64x2_t a, int64x2_t b); // VEOR q0,q0,q0
uint8x16_t veorq_u8(uint8x16_t a, uint8x16_t b); // VEOR q0,q0,q0
uint16x8_t veorq_u16(uint16x8_t a, uint16x8_t b); // VEOR q0,q0,q0
uint32x4_t veorq_u32(uint32x4_t a, uint32x4_t b); // VEOR q0,q0,q0
uint64x2_t veorq_u64(uint64x2_t a, uint64x2_t b); // VEOR q0,q0,q0
//Bit Clear
int8x8_t vbic_s8(int8x8_t a, int8x8_t b); // VBIC d0,d0,d0
int16x4_t vbic_s16(int16x4_t a, int16x4_t b); // VBIC d0,d0,d0
int32x2_t vbic_s32(int32x2_t a, int32x2_t b); // VBIC d0,d0,d0
int64x1_t vbic_s64(int64x1_t a, int64x1_t b); // VBIC d0,d0,d0
uint8x8_t vbic_u8(uint8x8_t a, uint8x8_t b); // VBIC d0,d0,d0
uint16x4_t vbic_u16(uint16x4_t a, uint16x4_t b); // VBIC d0,d0,d0
uint32x2_t vbic_u32(uint32x2_t a, uint32x2_t b); // VBIC d0,d0,d0
uint64x1_t vbic_u64(uint64x1_t a, uint64x1_t b); // VBIC d0,d0,d0
int8x16_t vbicq_s8(int8x16_t a, int8x16_t b); // VBIC q0,q0,q0
int16x8_t vbicq_s16(int16x8_t a, int16x8_t b); // VBIC q0,q0,q0
int32x4_t vbicq_s32(int32x4_t a, int32x4_t b); // VBIC q0,q0,q0
int64x2_t vbicq_s64(int64x2_t a, int64x2_t b); // VBIC q0,q0,q0
uint8x16_t vbicq_u8(uint8x16_t a, uint8x16_t b); // VBIC q0,q0,q0
uint16x8_t vbicq_u16(uint16x8_t a, uint16x8_t b); // VBIC q0,q0,q0
uint32x4_t vbicq_u32(uint32x4_t a, uint32x4_t b); // VBIC q0,q0,q0
uint64x2_t vbicq_u64(uint64x2_t a, uint64x2_t b); // VBIC q0,q0,q0
//Bitwise OR complement
int8x8_t vorn_s8(int8x8_t a, int8x8_t b); // VORN d0,d0,d0
int16x4_t vorn_s16(int16x4_t a, int16x4_t b); // VORN d0,d0,d0
int32x2_t vorn_s32(int32x2_t a, int32x2_t b); // VORN d0,d0,d0
int64x1_t vorn_s64(int64x1_t a, int64x1_t b); // VORN d0,d0,d0
uint8x8_t vorn_u8(uint8x8_t a, uint8x8_t b); // VORN d0,d0,d0
uint16x4_t vorn_u16(uint16x4_t a, uint16x4_t b); // VORN d0,d0,d0
uint32x2_t vorn_u32(uint32x2_t a, uint32x2_t b); // VORN d0,d0,d0
uint64x1_t vorn_u64(uint64x1_t a, uint64x1_t b); // VORN d0,d0,d0
int8x16_t vornq_s8(int8x16_t a, int8x16_t b); // VORN q0,q0,q0
int16x8_t vornq_s16(int16x8_t a, int16x8_t b); // VORN q0,q0,q0
int32x4_t vornq_s32(int32x4_t a, int32x4_t b); // VORN q0,q0,q0
int64x2_t vornq_s64(int64x2_t a, int64x2_t b); // VORN q0,q0,q0
uint8x16_t vornq_u8(uint8x16_t a, uint8x16_t b); // VORN q0,q0,q0
uint16x8_t vornq_u16(uint16x8_t a, uint16x8_t b); // VORN q0,q0,q0
uint32x4_t vornq_u32(uint32x4_t a, uint32x4_t b); // VORN q0,q0,q0
uint64x2_t vornq_u64(uint64x2_t a, uint64x2_t b); // VORN q0,q0,q0
//Bitwise Select
int8x8_t vbsl_s8(uint8x8_t a, int8x8_t b, int8x8_t c); // VBSL d0,d0,d0
int16x4_t vbsl_s16(uint16x4_t a, int16x4_t b, int16x4_t c); // VBSL d0,d0,d0
int32x2_t vbsl_s32(uint32x2_t a, int32x2_t b, int32x2_t c); // VBSL d0,d0,d0
int64x1_t vbsl_s64(uint64x1_t a, int64x1_t b, int64x1_t c); // VBSL d0,d0,d0
uint8x8_t vbsl_u8(uint8x8_t a, uint8x8_t b, uint8x8_t c); // VBSL d0,d0,d0
uint16x4_t vbsl_u16(uint16x4_t a, uint16x4_t b, uint16x4_t c); // VBSL d0,d0,d0
uint32x2_t vbsl_u32(uint32x2_t a, uint32x2_t b, uint32x2_t c); // VBSL d0,d0,d0
uint64x1_t vbsl_u64(uint64x1_t a, uint64x1_t b, uint64x1_t c); // VBSL d0,d0,d0
float32x2_t vbsl_f32(uint32x2_t a, float32x2_t b, float32x2_t c); // VBSL d0,d0,d0
poly8x8_t vbsl_p8(uint8x8_t a, poly8x8_t b, poly8x8_t c); // VBSL d0,d0,d0
poly16x4_t vbsl_p16(uint16x4_t a, poly16x4_t b, poly16x4_t c); // VBSL d0,d0,d0
int8x16_t vbslq_s8(uint8x16_t a, int8x16_t b, int8x16_t c); // VBSL q0,q0,q0
int16x8_t vbslq_s16(uint16x8_t a, int16x8_t b, int16x8_t c); // VBSL q0,q0,q0
int32x4_t vbslq_s32(uint32x4_t a, int32x4_t b, int32x4_t c); // VBSL q0,q0,q0
int64x2_t vbslq_s64(uint64x2_t a, int64x2_t b, int64x2_t c); // VBSL q0,q0,q0
uint8x16_t vbslq_u8(uint8x16_t a, uint8x16_t b, uint8x16_t c); // VBSL q0,q0,q0
uint16x8_t vbslq_u16(uint16x8_t a, uint16x8_t b, uint16x8_t c); // VBSL q0,q0,q0
uint32x4_t vbslq_u32(uint32x4_t a, uint32x4_t b, uint32x4_t c); // VBSL q0,q0,q0
uint64x2_t vbslq_u64(uint64x2_t a, uint64x2_t b, uint64x2_t c); // VBSL q0,q0,q0
float32x4_t vbslq_f32(uint32x4_t a, float32x4_t b, float32x4_t c); // VBSL q0,q0,q0
poly8x16_t vbslq_p8(uint8x16_t a, poly8x16_t b, poly8x16_t c); // VBSL q0,q0,q0
poly16x8_t vbslq_p16(uint16x8_t a, poly16x8_t b, poly16x8_t c); // VBSL q0,q0,q0
//Transposition operations
//Transpose elements
int8x8x2_t vtrn_s8(int8x8_t a, int8x8_t b); // VTRN.8 d0,d0
int16x4x2_t vtrn_s16(int16x4_t a, int16x4_t b); // VTRN.16 d0,d0
int32x2x2_t vtrn_s32(int32x2_t a, int32x2_t b); // VTRN.32 d0,d0
uint8x8x2_t vtrn_u8(uint8x8_t a, uint8x8_t b); // VTRN.8 d0,d0
uint16x4x2_t vtrn_u16(uint16x4_t a, uint16x4_t b); // VTRN.16 d0,d0
uint32x2x2_t vtrn_u32(uint32x2_t a, uint32x2_t b); // VTRN.32 d0,d0
float32x2x2_t vtrn_f32(float32x2_t a, float32x2_t b); // VTRN.32 d0,d0
poly8x8x2_t vtrn_p8(poly8x8_t a, poly8x8_t b); // VTRN.8 d0,d0
poly16x4x2_t vtrn_p16(poly16x4_t a, poly16x4_t b); // VTRN.16 d0,d0
int8x16x2_t vtrnq_s8(int8x16_t a, int8x16_t b); // VTRN.8 q0,q0
int16x8x2_t vtrnq_s16(int16x8_t a, int16x8_t b); // VTRN.16 q0,q0
int32x4x2_t vtrnq_s32(int32x4_t a, int32x4_t b); // VTRN.32 q0,q0
uint8x16x2_t vtrnq_u8(uint8x16_t a, uint8x16_t b); // VTRN.8 q0,q0
uint16x8x2_t vtrnq_u16(uint16x8_t a, uint16x8_t b); // VTRN.16 q0,q0
uint32x4x2_t vtrnq_u32(uint32x4_t a, uint32x4_t b); // VTRN.32 q0,q0
float32x4x2_t vtrnq_f32(float32x4_t a, float32x4_t b); // VTRN.32 q0,q0
poly8x16x2_t vtrnq_p8(poly8x16_t a, poly8x16_t b); // VTRN.8 q0,q0
poly16x8x2_t vtrnq_p16(poly16x8_t a, poly16x8_t b); // VTRN.16 q0,q0
//Interleave elements
int8x8x2_t vzip_s8(int8x8_t a, int8x8_t b); // VZIP.8 d0,d0
int16x4x2_t vzip_s16(int16x4_t a, int16x4_t b); // VZIP.16 d0,d0
int32x2x2_t vzip_s32(int32x2_t a, int32x2_t b); // VZIP.32 d0,d0
uint8x8x2_t vzip_u8(uint8x8_t a, uint8x8_t b); // VZIP.8 d0,d0
uint16x4x2_t vzip_u16(uint16x4_t a, uint16x4_t b); // VZIP.16 d0,d0
uint32x2x2_t vzip_u32(uint32x2_t a, uint32x2_t b); // VZIP.32 d0,d0
float32x2x2_t vzip_f32(float32x2_t a, float32x2_t b); // VZIP.32 d0,d0
poly8x8x2_t vzip_p8(poly8x8_t a, poly8x8_t b); // VZIP.8 d0,d0
poly16x4x2_t vzip_p16(poly16x4_t a, poly16x4_t b); // VZIP.16 d0,d0
int8x16x2_t vzipq_s8(int8x16_t a, int8x16_t b); // VZIP.8 q0,q0
int16x8x2_t vzipq_s16(int16x8_t a, int16x8_t b); // VZIP.16 q0,q0
int32x4x2_t vzipq_s32(int32x4_t a, int32x4_t b); // VZIP.32 q0,q0
uint8x16x2_t vzipq_u8(uint8x16_t a, uint8x16_t b); // VZIP.8 q0,q0
uint16x8x2_t vzipq_u16(uint16x8_t a, uint16x8_t b); // VZIP.16 q0,q0
uint32x4x2_t vzipq_u32(uint32x4_t a, uint32x4_t b); // VZIP.32 q0,q0
float32x4x2_t vzipq_f32(float32x4_t a, float32x4_t b); // VZIP.32 q0,q0
poly8x16x2_t vzipq_p8(poly8x16_t a, poly8x16_t b); // VZIP.8 q0,q0
poly16x8x2_t vzipq_p16(poly16x8_t a, poly16x8_t b); // VZIP.16 q0,q0
//De-Interleave elements
int8x8x2_t vuzp_s8(int8x8_t a, int8x8_t b); // VUZP.8 d0,d0
int16x4x2_t vuzp_s16(int16x4_t a, int16x4_t b); // VUZP.16 d0,d0
int32x2x2_t vuzp_s32(int32x2_t a, int32x2_t b); // VUZP.32 d0,d0
uint8x8x2_t vuzp_u8(uint8x8_t a, uint8x8_t b); // VUZP.8 d0,d0
uint16x4x2_t vuzp_u16(uint16x4_t a, uint16x4_t b); // VUZP.16 d0,d0
uint32x2x2_t vuzp_u32(uint32x2_t a, uint32x2_t b); // VUZP.32 d0,d0
float32x2x2_t vuzp_f32(float32x2_t a, float32x2_t b); // VUZP.32 d0,d0
poly8x8x2_t vuzp_p8(poly8x8_t a, poly8x8_t b); // VUZP.8 d0,d0
poly16x4x2_t vuzp_p16(poly16x4_t a, poly16x4_t b); // VUZP.16 d0,d0
int8x16x2_t vuzpq_s8(int8x16_t a, int8x16_t b); // VUZP.8 q0,q0
int16x8x2_t vuzpq_s16(int16x8_t a, int16x8_t b); // VUZP.16 q0,q0
int32x4x2_t vuzpq_s32(int32x4_t a, int32x4_t b); // VUZP.32 q0,q0
uint8x16x2_t vuzpq_u8(uint8x16_t a, uint8x16_t b); // VUZP.8 q0,q0
uint16x8x2_t vuzpq_u16(uint16x8_t a, uint16x8_t b); // VUZP.16 q0,q0
uint32x4x2_t vuzpq_u32(uint32x4_t a, uint32x4_t b); // VUZP.32 q0,q0
float32x4x2_t vuzpq_f32(float32x4_t a, float32x4_t b); // VUZP.32 q0,q0
poly8x16x2_t vuzpq_p8(poly8x16_t a, poly8x16_t b); // VUZP.8 q0,q0
poly16x8x2_t vuzpq_p16(poly16x8_t a, poly16x8_t b); // VUZP.16 q0,q0
]]

function wrapFunction1(line)
    local a,b,c,d = string.match(line, "^([%w_]+)%s+([%w_]+)%s*%(%s*([%w_]+)%s+([%w_]+)%s*%)")
    if a ~= nil and b ~= nil and c ~= nil and d ~= nil then
        io.write(a.." ".."np_"..b.."("..c.." "..d..")\n")
        io.write("{\n")
        io.write("\treturn "..b.."("..d..");\n")
        io.write("}\n")
        io.write("\n")
    end
end


function wrapFunction1b(line)
    local a,b,c,d = string.match(line, "^([%w_]+)%s+([%w_]+)%s*%(%s*__transfersize%(%d+%)%s*([%w_]+%s+const%s+%*)%s+([%w_]+)%s*%)")
    if a ~= nil and b ~= nil and c ~= nil and d ~= nil then
        io.write(a.." ".."np_"..b.."("..c.." "..d..")\n")
        io.write("{\n")
        io.write("\treturn "..b.."("..d..");\n")
        io.write("}\n")
        io.write("\n")
    end
end

function wrapFunction2(line)
    local a,b,c,d,e,f = string.match(line, "^([%w_]+)%s+([%w_]+)%s*%(%s*([%w_]+)%s+([%w_]+)%s*,%s*([%w_]+)%s*([%w_]+)%s*%)")
    if a ~= nil and b ~= nil and c ~= nil and d ~= nil and e ~= nil and f ~= nil then
        io.write(a.." ".."np_"..b.."("..c.." "..d..", "..e.." "..f..")\n")
        io.write("{\n")
        io.write("\treturn "..b.."("..d..", "..f..");\n")
        io.write("}\n")
        io.write("\n")
    end
end

function wrapFunction2b(line)
    local a,b,c,d,e,f = string.match(line, "^([%w_]+)%s+([%w_]+)%s*%(%s*__transfersize%(%d+%)%s*([%w_]+%s+const%s+%*)%s+([%w_]+)%s*,%s*([%w_]+)%s*([%w_]+)%s*%)")
    if a ~= nil and b ~= nil and c ~= nil and d ~= nil and e ~= nil and f ~= nil then
        io.write(a.." ".."np_"..b.."("..c.." "..d..", "..e.." "..f..")\n")
        io.write("{\n")
        io.write("\treturn "..b.."("..d..", "..f..");\n")
        io.write("}\n")
        io.write("\n")
    end
end

function wrapFunction3(line)
    local a,b,c,d,e,f,g,h = string.match(line, "^([%w_]+)%s+([%w_]+)%s*%(%s*([%w_]+)%s+([%w_]+)%s*,%s*([%w_]+)%s*([%w_]+)%s*%,%s*([%w_]+)%s*([%w_]+)%s*%)")
    if a ~= nil and b ~= nil and c ~= nil and d ~= nil and e ~= nil and f ~= nil and g ~= nil and h ~= nil then
        io.write(a.." ".."np_"..b.."("..c.." "..d..", "..e.." "..f..", "..g.." "..h..")\n")
        io.write("{\n")
        io.write("\treturn "..b.."("..d..", "..f..", "..h..");\n")
        io.write("}\n")
        io.write("\n")
    end
end

io.output("NEONvsSSE_layer.c")

for line in string.gmatch(functions, "[^\r\n]+") do
    wrapFunction1(line)
    wrapFunction1b(line)
    wrapFunction2(line)
    wrapFunction2b(line)
    wrapFunction3(line)
end

io.close()