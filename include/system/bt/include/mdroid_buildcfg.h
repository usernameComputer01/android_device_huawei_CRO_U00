
#ifndef MDROID_BUILDCFG_H
#define MDROID_BUILDCFG_H

/******************************************************************************
 * **
 * ** General Config
 * **
 * ******************************************************************************/

#if __STDC_VERSION__ < 199901L
#  ifndef FALSE
#    define FALSE 0
#  endif
#  ifndef TRUE
#    define TRUE (!FALSE)
#  endif
#else
#  include <stdbool.h>
#  ifndef FALSE
#    define FALSE  false
#  endif
#  ifndef TRUE
#    define TRUE   true
#  endif
#endif

#ifdef MTK_BT_COMMON
#define MTK_COMMON                     TRUE

// #define BT_TRACE_VERBOSE            TRUE
// #define SMP_DEBUG                   TRUE
// #define SDP_DEBUG_RAW               TRUE

/******************************************************************************
 * **
 * ** MTK BT feature option
 * **
 * ******************************************************************************/

/* MTK config in bt_stack.conf */
#ifndef MTK_STACK_CONFIG
#define MTK_STACK_CONFIG               TRUE
#endif

#if MTK_STACK_CONFIG == TRUE

#define MTK_STACK_CONFIG_VALUE_SEPARATOR ","
#define MTK_STACK_CONFIG_PARTIAL_NAME_VALUE_MAX 1024

#define MTK_STACK_CONFIG_FPATH_LEN 1024
#define MTK_STACK_CONFIG_NUM_OF_HEXLIST 5
#define MTK_STACK_CONFIG_NUM_OF_HEXITEMS 260
#define MTK_STACK_CONFIG_NUM_OF_HEXROWITEMS 16
#define MTK_STACK_CONFIG_NUM_OF_HEXCOLUMNITEMS 16

/* Role switch & sniff subrating blacklist */
#ifndef MTK_STACK_CONFIG_BL
#define MTK_STACK_CONFIG_BL            TRUE
#endif

/* fwlog hcl hexlist */
#ifndef MTK_STACK_CONFIG_LOG
#define MTK_STACK_CONFIG_LOG           TRUE
#endif

/* Blueangel to Bluedroid paired device database convert */
#ifndef MTK_STACK_BA2BD_CONVERT
#define MTK_STACK_BA2BD_CONVERT TRUE
#endif//MTK_STACK_BA2BD_CONVERT

#endif /* MTK_STACK_CONFIG == TRUE */

/******************************************************************************
 * **
 * ** BLE
 * **
 * ******************************************************************************/

/*For MTK solution, vendor specific extensions is supported by default*/
#ifndef BLE_VND_INCLUDED
#define BLE_VND_INCLUDED               TRUE
#endif

/*For MTK BT chip, set below CE length*/
#ifndef MTK_BLE_CONN_MIN_CE_LEN
#define MTK_BLE_CONN_MIN_CE_LEN    0x0060
#endif

#ifndef MTK_BLE_CONN_MAX_CE_LEN
#define MTK_BLE_CONN_MAX_CE_LEN    0x0140
#endif

/*For devices request maximum connection interval < 7.5ms*/
#ifndef MTK_BLE_CONN_INT_MIN_LIMIT
#define MTK_BLE_CONN_INT_MIN_LIMIT    0x000c
#endif

#ifndef MTK_BLE_CONN_INT_MAX_LIMIT
#define MTK_BLE_CONN_INT_MAX_LIMIT    0x0018
#endif
/******************************************************************************
**
** GKI Buffer Pools
**
******************************************************************************/
/* Pool ID where to reassemble the SDU.
This Pool allows buffers to be used that are larger than
the L2CAP_MAX_MTU. */
#ifndef MTK_AVCT_BR_USER_RX_POOL_ID
#define MTK_AVCT_BR_USER_RX_POOL_ID     HCI_ACL_POOL_ID
#endif

/* Pool ID where to hold the SDU.
This Pool allows buffers to be used that are larger than
the L2CAP_MAX_MTU. */
#ifndef MTK_AVCT_BR_USER_TX_POOL_ID
#define MTK_AVCT_BR_USER_TX_POOL_ID     HCI_ACL_POOL_ID
#endif

/*
GKI Buffer Pool ID used to hold MPS segments during SDU reassembly
*/
#ifndef MTK_AVCT_BR_FCR_RX_POOL_ID
#define MTK_AVCT_BR_FCR_RX_POOL_ID      HCI_ACL_POOL_ID
#endif

/*
GKI Buffer Pool ID used to hold MPS segments used in (re)transmissions.
L2CAP_DEFAULT_ERM_POOL_ID is specified to use the HCI ACL data pool.
Note:  This pool needs to have enough buffers to hold two times the window size negotiated
in the tL2CAP_FCR_OPTIONS (2 * tx_win_size)  to allow for retransmissions.
The size of each buffer must be able to hold the maximum MPS segment size passed in
tL2CAP_FCR_OPTIONS plus BT_HDR (8) + HCI preamble (4) + L2CAP_MIN_OFFSET (11 - as of BT 2.1 + EDR Spec).
*/
#ifndef MTK_AVCT_BR_FCR_TX_POOL_ID
#define MTK_AVCT_BR_FCR_TX_POOL_ID      HCI_ACL_POOL_ID
#endif

/******************************************************************************
 * **
 * ** 3D Synchronization Profile (B3DS)
 * **
 * ******************************************************************************/

#ifndef MTK_B3DS_INCLUDED
#define MTK_B3DS_INCLUDED             FALSE
#endif

#if MTK_B3DS_INCLUDED == TRUE

#ifndef MTK_B3DS_SERVICE_NAME
#define MTK_B3DS_SERVICE_NAME         "3D Synchronization"
#endif

/* Must use no security */
#define MTK_B3DS_SECURITY_LEVEL       BTM_SEC_NONE

/* Firmware's workaround, use all 1 in Event Mask 2 */
#ifndef MTK_EVENT_MASK
#define MTK_EVENT_MASK                TRUE
#endif

#ifndef MTK_B3DS_FIXED_COD
#define MTK_B3DS_FIXED_COD            TRUE
#endif

/* Must enable for B3DS */
#define L2CAP_UCD_INCLUDED            TRUE

/* No-UI mode */
#ifndef MTK_B3DS_DEMO
#define MTK_B3DS_DEMO                 TRUE
#endif

/* B3DS class of device
 * * {SERVICE_CLASS, MAJOR_CLASS, MINOR_CLASS}
 * *
 * * SERVICE_CLASS:0x08 (Bit19 - Capturing)
 * * MAJOR_CLASS:0x04 - MAJOR_AUDIO
 * * MINOR_CLASS:0x0C - MINOR_AUDIO_VIDEOSPEAKER
 * *
 * */
#if (MTK_B3DS_FIXED_COD == TRUE)
#define BTA_DM_COD {0x08, 0x04, 0x3C}
#endif

#endif /* if MTK_B3DS_INCLUDED == TRUE */

/******************************************************************************
 * **
 * ** Legacy B3DS
 * **
 * ******************************************************************************/

#ifndef MTK_LEGACY_B3DS_INCLUDED
#define MTK_LEGACY_B3DS_INCLUDED      FALSE
#endif

#if (MTK_B3DS_INCLUDED == TRUE) && (MTK_LEGACY_B3DS_INCLUDED == TRUE)

#ifndef BTM_EIR_DEFAULT_FEC_REQUIRED
#define BTM_EIR_DEFAULT_FEC_REQUIRED  FALSE
#endif

#ifndef MTK_LEGACY_B3DS_SHORTEN_EIR
#define MTK_LEGACY_B3DS_SHORTEN_EIR   TRUE
#endif

#endif /* MTK_LEGACY_B3DS_INCLUDED == TRUE */

/******************************************************************************
 * **
 * ** Advanced Audio Distribution Profile (A2DP)
 * **
 * ******************************************************************************/

/* A2DP advanced codec support */

/* support A2DP SRC AAC codec */
/* Please enable this feature by changing option value defined here*/
#ifndef MTK_A2DP_SRC_AAC_CODEC
#define MTK_A2DP_SRC_AAC_CODEC  TRUE
#endif

/* support A2DP SRC APTX codec */
/* Please enable this feature by adding feature option in ProjectConfig.mk*/
#ifdef MTK_BT_A2DP_SRC_APTX_CODEC
#define MTK_A2DP_SRC_APTX_CODEC  TRUE
#endif

/* Content protection: SCMS_T switch */
#ifndef BTA_AV_CO_CP_SCMS_T
#define BTA_AV_CO_CP_SCMS_T  TRUE
#endif

/* support a2dp audio dump debug feature */
#ifndef MTK_A2DP_PCM_DUMP
#define MTK_A2DP_PCM_DUMP TRUE
#endif

/* BTIF_MEDIA_FR_PER_TICKS_44_1_APTX: considering 1 frame as 16 aptX samples (4 bytes per sample)
  1 sample duration(us) = 4 * 1000000/44100
  13.75 frames/tick @ 20 ms tick (1 out of 4 frames sends one less) */
#define BTIF_MEDIA_FR_PER_TICKS_44_1_APTX (14)

/* Parameters relate to AAC codec */
#define MTK_A2DP_AAC_DEFAULT_BIT_RATE 200000
#define MTK_A2DP_BTIF_MEDIA_FR_PER_TICKS_AAC MTK_A2DP_BTIF_MEDIA_TIME_EXT
#define MTK_A2DP_AAC_ENC_INPUT_BUF_SIZE (4*1024)
#define MTK_A2DP_AAC_ENC_OUTPUT_BUF_SIZE (4*1024)
#define MTK_A2DP_AAC_READ_BUF_SIZE (BTIF_MEDIA_TIME_TICK * 44100 / 1000 * 2 * 2)
#define MTK_A2DP_AAC_LIMIT_MTU_SIZE (800)

/*For Low power bug fix*/
#define BTIF_MEDIA_NUM_TICK 1
#define MTK_A2DP_BTIF_MEDIA_TIME_EXT (3)
#define BTIF_MEDIA_TIME_TICK    (20 * BTIF_MEDIA_NUM_TICK * MTK_A2DP_BTIF_MEDIA_TIME_EXT)
#define MAX_OUTPUT_A2DP_FRAME_QUEUE_SZ    18 * MTK_A2DP_BTIF_MEDIA_TIME_EXT
#define MAX_PCM_FRAME_NUM_PER_TICK    14 * MTK_A2DP_BTIF_MEDIA_TIME_EXT

/******************************************************************************
 * **
 * ** Audio/Video Remote Control Profile (AVRCP)
 * **
 * ******************************************************************************/
#ifdef MTK_BT_AVRCP_TG_15

/* support AVRCP 1.5 version target role
Following features are included
1. Media player selection is mandandory (if support catogary 1)
2. Get Folder Item - media player list (if support catogary 1)
3. SDP record for AVRCP 1.5 */
#define MTK_AVRCP_TG_15 TRUE

#define MTK_AVRCP_VERSION_SDP_POSITION 7
#define MTK_AVRCP_13_VERSION 0x03
#define MTK_AVRCP_14_VERSION 0x04

#endif /* ifdef MTK_BT_AVRCP_TG_15 */

/******************************************************************************
 * **
 * ** Audio/Video Control Transport Protocol (AVCTP)
 * **
 * ******************************************************************************/

#ifdef MTK_BT_AVRCP_TG_15

/* enable AOSP avct browse included */
#define AVCT_BROWSE_INCLUDED        TRUE

#define MTK_AVCT_BROWSE_INCLUDED TRUE

#endif /* ifdef MTK_BT_AVRCP_TG_15 */

/* AVCTP Browsing channel FCR Option:
Size of the transmission window when using enhanced retransmission mode. Not used
in basic and streaming modes. Range: 1 - 63
*/
#ifndef MTK_AVCT_BR_FCR_OPT_TX_WINDOW_SIZE
#define MTK_AVCT_BR_FCR_OPT_TX_WINDOW_SIZE      10
#endif

/* AVCTP Browsing channel FCR Option:
Number of transmission attempts for a single I-Frame before taking
Down the connection. Used In ERTM mode only. Value is Ignored in basic and
Streaming modes.
Range: 0, 1-0xFF
0 - infinite retransmissions
1 - single transmission
*/
#ifndef MTK_AVCT_BR_FCR_OPT_MAX_TX_B4_DISCNT
#define MTK_AVCT_BR_FCR_OPT_MAX_TX_B4_DISCNT    20
#endif

/* AVCTP Browsing channel FCR Option: Retransmission Timeout
The AVRCP specification set a value in the range of 300 - 2000 ms
Timeout (in msecs) to detect Lost I-Frames. Only used in Enhanced retransmission mode.
Range: Minimum 2000 (2 secs) when supporting PBF.
*/
#ifndef MTK_AVCT_BR_FCR_OPT_RETX_TOUT
#define MTK_AVCT_BR_FCR_OPT_RETX_TOUT           2000
#endif

/* AVCTP Browsing channel FCR Option: Monitor Timeout
The AVRCP specification set a value in the range of 300 - 2000 ms
Timeout (in msecs) to detect Lost S-Frames. Only used in Enhanced retransmission mode.
Range: Minimum 12000 (12 secs) when supporting PBF.
*/
#ifndef MTK_AVCT_BR_FCR_OPT_MONITOR_TOUT
#define MTK_AVCT_BR_FCR_OPT_MONITOR_TOUT        12000
#endif

/* AVCTP browsing channel FCR Option: Maximum PDU payload size.
The maximum number of payload octets that the local device can receive in a single PDU.
*/
#ifndef MTK_AVCT_BR_FCR_OPT_MPS_SIZE
#define MTK_AVCT_BR_FCR_OPT_MPS_SIZE            1000
#endif

/******************************************************************************
 * **
 * ** HANDS FREE PROFILE (HFP)
 * **
 * ******************************************************************************/
#ifdef MTK_BT_HFP_AG_17
/*HF indicator feature for 17*/
#define MTK_HFP_HF_IND              TRUE
#endif /* ifdef MTK_BT_HFP_AG_17 */

/* Wide Band Speech */
#ifndef MTK_HFP_WBS
#define MTK_HFP_WBS                 TRUE
#endif

/* In-band Ringtone */
#ifndef MTK_HFP_INBAND_RING
#define MTK_HFP_INBAND_RING         FALSE
#endif

/* Use eSCO S4 */
#ifndef MTK_HFP_eSCO_S4
#define MTK_HFP_eSCO_S4             FALSE
#endif

#if MTK_HFP_WBS == TRUE
#ifndef BTM_WBS_INCLUDED
#define BTM_WBS_INCLUDED            TRUE
#endif

#ifndef BTIF_HF_WBS_PREFERRED
#define BTIF_HF_WBS_PREFERRED       TRUE
#endif
#endif /* if MTK_HFP_WBS == TRUE */

/******************************************************************************
 * **
 * ** Detect Chip Reset
 * **
 * ******************************************************************************/

/* Support handle whole-chip-reset in hci transport interface. */
#ifndef MTK_HCITRANS_DETECT_CHIP_RESET
#define MTK_HCITRANS_DETECT_CHIP_RESET  TRUE
#endif

/******************************************************************************
 * **
 * ** Firmware Coredump
 * **
 * ******************************************************************************/

/* Support firmware coredump which is driven by host stack. */
#ifndef MTK_FWLOG_TRIG_COREDUMP
#define MTK_FWLOG_TRIG_COREDUMP      TRUE
#endif

/******************************************************************************
**
** ATT/GATT Protocol/Profile Settings
**
******************************************************************************/
#ifndef BTA_DM_GATT_CLOSE_DELAY_TOUT
#define BTA_DM_GATT_CLOSE_DELAY_TOUT    1500
#endif

/******************************************************************************
**
** HID/HOGP Profile Settings
**
******************************************************************************/
#ifndef MTK_HID_IOT_MOUSE_IME
#define MTK_HID_IOT_MOUSE_IME    TRUE
#endif

#ifdef MTK_BT_KERNEL_3_18
#define MTK_HID_DRIVER_KERNEL_3_18    TRUE
#endif
/******************************************************************************
 * **
 * **
 * **
 * ******************************************************************************/

#endif /* ifdef MTK_BT_COMMON */

#endif /* ifndef MDROID_BUILDCFG_H */
