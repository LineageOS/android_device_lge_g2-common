#define CAMERA_PARAMETERS_EXTRA_C  \
const char CameraParameters::BURST_SHOT_OFF[] = "burst-shot"; \
const char CameraParameters::BURST_SHOT_ON[] = "burst-shot"; \
const char CameraParameters::FOCUS_MODE_MANUAL_POSITION[] = "manual-position"; \
const char CameraParameters::KEY_BURST_SHOT[] = "burst-shot"; \
const char CameraParameters::KEY_FOCUS_MODE_OBJECT_TRACKING[] = "object-tracking"; \
const char CameraParameters::WHITE_BALANCE_MANUAL_CCT[] = "white-balance-manual";


#define CAMERA_PARAMETERS_EXTRA_H \
static const char BURST_SHOT_OFF[]; \
static const char BURST_SHOT_ON[]; \
static const char FOCUS_MODE_MANUAL_POSITION[]; \
static const char KEY_BURST_SHOT[]; \
static const char KEY_FOCUS_MODE_OBJECT_TRACKING[]; \
static const char WHITE_BALANCE_MANUAL_CCT[];

