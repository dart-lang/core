// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Helper for displaying names of categories.
import 'package:characters/src/grapheme_clusters/constants.dart';

final categoryNames = List.filled(categoryCount, "")
  ..[categoryCR] = "CR"
  ..[categoryControl] = "Control"
  ..[categoryOther] = "Other"
  ..[categoryExtend] = "Extend"
  ..[categorySpacingMark] = "SpacingMark"
  ..[categoryRegionalIndicator] = "RegionalIndicator"
  ..[categoryPictographic] = "Pictographic"
  ..[categoryLF] = "LF"
  ..[categoryPrepend] = "Prepend"
  ..[categoryL] = "L"
  ..[categoryV] = "V"
  ..[categoryT] = "T"
  ..[categoryLV] = "LV"
  ..[categoryLVT] = "LVT"
  ..[categoryOtherIndicConsonant] = "OtherIndicConsonant"
  ..[categoryZWJ] = "ZWJ"
  ..[categoryExtendIndicExtend] = "ExtendIndicExtend"
  ..[categoryExtendIndicLinked] = "ExtendIndicLinked"
  ..[categoryEoT] = "EoT"
  ..forEach((text) {
    if (text.isEmpty) throw StateError("Uninitialized category name");
  });

final categoryShortNames = List.filled(categoryCount, "")
  ..[categoryCR] = "CR"
  ..[categoryControl] = "Ctl"
  ..[categoryOther] = "Otr"
  ..[categoryExtend] = "Ext"
  ..[categorySpacingMark] = "Spc"
  ..[categoryRegionalIndicator] = "Reg"
  ..[categoryPictographic] = "Pic"
  ..[categoryLF] = "LF"
  ..[categoryPrepend] = "Pre"
  ..[categoryL] = "L"
  ..[categoryV] = "V"
  ..[categoryT] = "T"
  ..[categoryLV] = "LV"
  ..[categoryLVT] = "LVT"
  ..[categoryOtherIndicConsonant] = "OInC"
  ..[categoryZWJ] = "ZWJ"
  ..[categoryExtendIndicExtend] = "EInE"
  ..[categoryExtendIndicLinked] = "EInL"
  ..[categoryEoT] = "EoT"
  ..forEach((text) {
    if (text.isEmpty) throw StateError("Uninitialized category short name");
  });

final List<String> categoryLongNames = List<String>.filled(categoryCount, "")
  ..[categoryOther] = "Other"
  ..[categoryCR] = "CR"
  ..[categoryLF] = "LF"
  ..[categoryControl] = "Control"
  ..[categoryExtend] = "Extend"
  ..[categoryZWJ] = "ZWJ"
  ..[categoryRegionalIndicator] = "RI"
  ..[categoryPrepend] = "Prepend"
  ..[categorySpacingMark] = "SpacingMark"
  ..[categoryL] = "L"
  ..[categoryV] = "V"
  ..[categoryT] = "T"
  ..[categoryLV] = "LV"
  ..[categoryLVT] = "LVT"
  ..[categoryPictographic] = "Pictographic"
  ..[categoryOtherIndicConsonant] = "Other{InCB=Consonant}"
  ..[categoryExtendIndicExtend] = "Extend{InCB=Extend}"
  ..[categoryExtendIndicLinked] = "Extend{InCB=Linked}"
  ..[categoryEoT] = "EoT";

final stateNames = List<String>.filled(idStateCount, "")
  ..[idStateSoT] = "SoT"
  ..[idStateBreak] = "Break"
  ..[idStateCR] = "CR"
  ..[idStateOther] = "Other"
  ..[idStatePrepend] = "Prepend"
  ..[idStateL] = "L"
  ..[idStateV] = "V"
  ..[idStateT] = "T"
  ..[idStatePictographic] = "Pictographic"
  ..[idStatePictographicZWJ] = "PictographicZWJ"
  ..[idStateRegionalSingle] = "RegionalSingle"
  ..[idStateSoTNoBreak] = "SoTNoBreak"
  ..[idStateInC] = "InC"
  ..[idStateInCL] = "InCL";

final stateShortNames = List<String>.filled(idStateCount, "")
  ..[idStateSoT] = "SoT"
  ..[idStateBreak] = "Brk"
  ..[idStateCR] = "CR"
  ..[idStateOther] = "Otr"
  ..[idStatePrepend] = "Pre"
  ..[idStateL] = "L"
  ..[idStateV] = "V"
  ..[idStateT] = "T"
  ..[idStatePictographic] = "Pic"
  ..[idStatePictographicZWJ] = "PicZ"
  ..[idStateRegionalSingle] = "Reg"
  ..[idStateSoTNoBreak] = "SoTN"
  ..[idStateInC] = "InC"
  ..[idStateInCL] = "InCL";

final backStateNames = List<String>.filled(backStateWithLACount, "")
  ..[idStateEoT] = "EoT"
  ..[idStateBreak] = "Break"
  ..[idStateLF] = "LF"
  ..[idStateOther] = "Other"
  ..[idStateExtend] = "Extend"
  ..[idStateL] = "L"
  ..[idStateV] = "V"
  ..[idStateT] = "T"
  ..[idStatePictographic] = "Pictographic"
  ..[idStateRegionalOdd] = "RegionalOdd" // Known disjoint look-ahead
  ..[idStateRegionalSingle] = "RegionalSingle"
  ..[idStateEoTNoBreak] = "EoTNoBreak"
  ..[idStateInC] = "InC"
  ..[idStateRegionalEven] = "RegionalEven"
  ..[idStateLookaheadRegionalEven] = "RegionalLookaheadEven"
  ..[idStateLookaheadRegionalOdd] = "RegionalLookaheadOdd"
  ..[idStateLookaheadZWJPictographic] = "ZWJPictographicLookahead"
  ..[idStateLookaheadInC] = "InCLookahead"
  ..[idStateLookaheadInCL] = "InCLLookahead";

final backStateShortNames = List<String>.filled(backStateWithLACount, "")
  ..[idStateEoT] = "EoT"
  ..[idStateBreak] = "Brk"
  ..[idStateLF] = "LF"
  ..[idStateOther] = "Otr"
  ..[idStateExtend] = "Ext"
  ..[idStateL] = "L"
  ..[idStateV] = "V"
  ..[idStateT] = "T"
  ..[idStatePictographic] = "Pic"
  ..[idStateRegionalOdd] = "RegO"
  ..[idStateRegionalSingle] = "Reg"
  ..[idStateEoTNoBreak] = "EoTN"
  ..[idStateInC] = "InC"
  ..[idStateRegionalEven] = "RegE"
  ..[idStateLookaheadRegionalEven] = "LARe"
  ..[idStateLookaheadRegionalOdd] = "LARo"
  ..[idStateLookaheadZWJPictographic] = "LAZP"
  ..[idStateLookaheadInC] = "LAIC"
  ..[idStateLookaheadInCL] = "LAIL";
