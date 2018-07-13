#define RIL_UNSOL_ON_SS_LGE 1042
#define RIL_UNSOL_STK_CC_ALPHA_NOTIFY_LGE 1043

static inline void remapUnsol(int *unsol) {
    switch(*unsol) {
        case RIL_UNSOL_ON_SS_LGE:
            *unsol = RIL_UNSOL_ON_SS;
            return;
        case RIL_UNSOL_STK_CC_ALPHA_NOTIFY_LGE:
            *unsol = RIL_UNSOL_STK_CC_ALPHA_NOTIFY;
            return;
    }
}
