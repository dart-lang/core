// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Helper for displaying names of categories.
import 'package:characters/src/grapheme_clusters/constants.dart';

final categoryNames = List.filled(categoryCount, '')
  ..[categoryCR] = 'CR'
  ..[categoryControl] = 'Control'
  ..[categoryOther] = 'Other'
  ..[categoryExtend] = 'Extend'
  ..[categorySpacingMark] = 'SpacingMark'
  ..[categoryRegionalIndicator] = 'RegionalIndicator'
  ..[categoryPictographic] = 'Pictographic'
  ..[categoryLF] = 'LF'
  ..[categoryPrepend] = 'Prepend'
  ..[categoryL] = 'L'
  ..[categoryV] = 'V'
  ..[categoryT] = 'T'
  ..[categoryLV] = 'LV'
  ..[categoryLVT] = 'LVT'
  ..[categoryOtherIndicConsonant] = 'OtherIndicConsonant'
  ..[categoryZWJ] = 'ZWJ'
  ..[categoryExtendIndicExtend] = 'ExtendIndicExtend'
  ..[categoryExtendIndicLinked] = 'ExtendIndicLinked'
  ..[categoryEoT] = 'EoT'
  ..forEach((text) {
    if (text.isEmpty) throw StateError('Uninitialized category name');
  });

final categoryShortNames = List.filled(categoryCount, '')
  ..[categoryCR] = 'CR'
  ..[categoryControl] = 'Ctl'
  ..[categoryOther] = 'Otr'
  ..[categoryExtend] = 'Ext'
  ..[categorySpacingMark] = 'Spc'
  ..[categoryRegionalIndicator] = 'Reg'
  ..[categoryPictographic] = 'Pic'
  ..[categoryLF] = 'LF'
  ..[categoryPrepend] = 'Pre'
  ..[categoryL] = 'L'
  ..[categoryV] = 'V'
  ..[categoryT] = 'T'
  ..[categoryLV] = 'LV'
  ..[categoryLVT] = 'LVT'
  ..[categoryOtherIndicConsonant] = 'OInC'
  ..[categoryZWJ] = 'ZWJ'
  ..[categoryExtendIndicExtend] = 'EInE'
  ..[categoryExtendIndicLinked] = 'EInL'
  ..[categoryEoT] = 'EoT'
  ..forEach((text) {
    if (text.isEmpty) throw StateError('Uninitialized category short name');
  });

final List<String> categoryLongNames = List<String>.filled(categoryCount, '')
  ..[categoryOther] = 'Other'
  ..[categoryCR] = 'CR'
  ..[categoryLF] = 'LF'
  ..[categoryControl] = 'Control'
  ..[categoryExtend] = 'Extend'
  ..[categoryZWJ] = 'ZWJ'
  ..[categoryRegionalIndicator] = 'RI'
  ..[categoryPrepend] = 'Prepend'
  ..[categorySpacingMark] = 'SpacingMark'
  ..[categoryL] = 'L'
  ..[categoryV] = 'V'
  ..[categoryT] = 'T'
  ..[categoryLV] = 'LV'
  ..[categoryLVT] = 'LVT'
  ..[categoryPictographic] = 'Pictographic'
  ..[categoryOtherIndicConsonant] = 'Other{InCB=Consonant}'
  ..[categoryExtendIndicExtend] = 'Extend{InCB=Extend}'
  ..[categoryExtendIndicLinked] = 'Extend{InCB=Linked}'
  ..[categoryEoT] = 'EoT';

String stateName(int state) => _stateNames[state ~/ automatonRowLength];
final _stateNames = List<String>.filled(stateLimit ~/ automatonRowLength, '')
  ..[stateSoT ~/ automatonRowLength] = 'SoT'
  ..[stateBreak ~/ automatonRowLength] = 'Break'
  ..[stateCR ~/ automatonRowLength] = 'CR'
  ..[stateOther ~/ automatonRowLength] = 'Other'
  ..[statePrepend ~/ automatonRowLength] = 'Prepend'
  ..[stateL ~/ automatonRowLength] = 'L'
  ..[stateV ~/ automatonRowLength] = 'V'
  ..[stateT ~/ automatonRowLength] = 'T'
  ..[statePictographic ~/ automatonRowLength] = 'Pictographic'
  ..[statePictographicZWJ ~/ automatonRowLength] = 'PictographicZWJ'
  ..[stateRegionalSingle ~/ automatonRowLength] = 'RegionalSingle'
  ..[stateSoTNoBreak ~/ automatonRowLength] = 'SoTNoBreak'
  ..[stateInC ~/ automatonRowLength] = 'InC'
  ..[stateInCL ~/ automatonRowLength] = 'InCL'
  ..[stateCAny ~/ automatonRowLength] = '?'
  ..[stateCZWJ ~/ automatonRowLength] = '?+ZWJ'
  ..[stateCIE ~/ automatonRowLength] = '?+IndicExtend'
  ..[stateCIL ~/ automatonRowLength] = '?+IndicLinked'
  ..[stateCIEZ ~/ automatonRowLength] = '?+IndicExtendZWJ'
  ..[stateCILZ ~/ automatonRowLength] = '?+IndicLinkedZWJ'
  ..[stateCZIE ~/ automatonRowLength] = '?+ZWJIndicExtend'
  ..[stateCZIL ~/ automatonRowLength] = '?+ZWJIndicLinked'
  ..[stateCExt ~/ automatonRowLength] = '?+Extend'
  ..[stateCExZ ~/ automatonRowLength] = '?+ExtendZWJ'
  ..[stateCReg ~/ automatonRowLength] = '?+Reg';

String stateShortName(int state) =>
    _stateShortNames[state ~/ automatonRowLength];
final _stateShortNames =
    List<String>.filled(stateLimit ~/ automatonRowLength, '')
      ..[stateSoT ~/ automatonRowLength] = 'SoT'
      ..[stateBreak ~/ automatonRowLength] = 'Brk'
      ..[stateCR ~/ automatonRowLength] = 'CR'
      ..[stateOther ~/ automatonRowLength] = 'Otr'
      ..[statePrepend ~/ automatonRowLength] = 'Pre'
      ..[stateL ~/ automatonRowLength] = 'L'
      ..[stateV ~/ automatonRowLength] = 'V'
      ..[stateT ~/ automatonRowLength] = 'T'
      ..[statePictographic ~/ automatonRowLength] = 'Pic'
      ..[statePictographicZWJ ~/ automatonRowLength] = 'PicZ'
      ..[stateRegionalSingle ~/ automatonRowLength] = 'Reg'
      ..[stateSoTNoBreak ~/ automatonRowLength] = 'SoTN'
      ..[stateInC ~/ automatonRowLength] = 'InC'
      ..[stateInCL ~/ automatonRowLength] = 'InCL'
      ..[stateCAny ~/ automatonRowLength] = 'CAny'
      ..[stateCZWJ ~/ automatonRowLength] = 'CZWJ'
      ..[stateCIE ~/ automatonRowLength] = 'CIE'
      ..[stateCIL ~/ automatonRowLength] = 'CIL'
      ..[stateCIEZ ~/ automatonRowLength] = 'CIEZ'
      ..[stateCILZ ~/ automatonRowLength] = 'CILZ'
      ..[stateCZIE ~/ automatonRowLength] = 'CZIE'
      ..[stateCZIL ~/ automatonRowLength] = 'CZIL'
      ..[stateCExt ~/ automatonRowLength] = 'CExt'
      ..[stateCExZ ~/ automatonRowLength] = 'CExZ'
      ..[stateCReg ~/ automatonRowLength] = 'CReg';

String backStateName(int state) => _backStateNames[state ~/ automatonRowLength];
final _backStateNames = List<String>.filled(
    backStateLimit ~/ automatonRowLength, '')
  ..[stateEoT ~/ automatonRowLength] = 'EoT'
  ..[stateBreak ~/ automatonRowLength] = 'Break'
  ..[stateLF ~/ automatonRowLength] = 'LF'
  ..[stateOther ~/ automatonRowLength] = 'Other'
  ..[stateExtend ~/ automatonRowLength] = 'Extend'
  ..[stateL ~/ automatonRowLength] = 'L'
  ..[stateV ~/ automatonRowLength] = 'V'
  ..[stateT ~/ automatonRowLength] = 'T'
  ..[statePictographic ~/ automatonRowLength] = 'Pictographic'
  ..[stateRegionalOdd ~/ automatonRowLength] =
      'RegionalOdd' // Known disjoint look-ahead
  ..[stateRegionalSingle ~/ automatonRowLength] = 'RegionalSingle'
  ..[stateEoTNoBreak ~/ automatonRowLength] = 'EoTNoBreak'
  ..[stateInC ~/ automatonRowLength] = 'InC'
  ..[stateRegionalEven ~/ automatonRowLength] = 'RegionalEven'
  ..[stateLookaheadRegionalEven ~/ automatonRowLength] = 'RegionalLookaheadEven'
  ..[stateLookaheadRegionalOdd ~/ automatonRowLength] = 'RegionalLookaheadOdd'
  ..[stateLookaheadZWJPictographic ~/ automatonRowLength] =
      'ZWJPictographicLookahead'
  ..[stateLookaheadInC ~/ automatonRowLength] = 'InCLookahead'
  ..[stateLookaheadInCL ~/ automatonRowLength] = 'InCLLookahead';

String backStateShortName(int state) =>
    _backStateShortNames[state ~/ automatonRowLength];
final _backStateShortNames =
    List<String>.filled(backStateLimit ~/ automatonRowLength, '')
      ..[stateEoT ~/ automatonRowLength] = 'EoT'
      ..[stateBreak ~/ automatonRowLength] = 'Brk'
      ..[stateLF ~/ automatonRowLength] = 'LF'
      ..[stateOther ~/ automatonRowLength] = 'Otr'
      ..[stateExtend ~/ automatonRowLength] = 'Ext'
      ..[stateL ~/ automatonRowLength] = 'L'
      ..[stateV ~/ automatonRowLength] = 'V'
      ..[stateT ~/ automatonRowLength] = 'T'
      ..[statePictographic ~/ automatonRowLength] = 'Pic'
      ..[stateRegionalOdd ~/ automatonRowLength] = 'RegO'
      ..[stateRegionalSingle ~/ automatonRowLength] = 'Reg'
      ..[stateEoTNoBreak ~/ automatonRowLength] = 'EoTN'
      ..[stateInC ~/ automatonRowLength] = 'InC'
      ..[stateRegionalEven ~/ automatonRowLength] = 'RegE'
      ..[stateLookaheadRegionalEven ~/ automatonRowLength] = 'LARe'
      ..[stateLookaheadRegionalOdd ~/ automatonRowLength] = 'LARo'
      ..[stateLookaheadZWJPictographic ~/ automatonRowLength] = 'LAZP'
      ..[stateLookaheadInC ~/ automatonRowLength] = 'LAIC'
      ..[stateLookaheadInCL ~/ automatonRowLength] = 'LAIL';
