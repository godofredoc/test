// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library unittest.backend.suite;

import 'dart:collection';

import 'metadata.dart';
import 'test.dart';

/// A test suite.
///
/// A test suite is a set of tests that are intended to be run together and that
/// share default configuration.
class Suite {
  /// A description of the platform on which the suite is running, or `null` if
  /// that platform is unknown.
  final String platform;

  /// The path to the Dart test suite, or `null` if that path is unknown.
  final String path;

  /// The metadata associated with this test suite.
  final Metadata metadata;

  /// The tests in the test suite.
  final List<Test> tests;

  Suite(Iterable<Test> tests, {this.path, this.platform, Metadata metadata})
      : metadata = metadata == null ? new Metadata() : metadata,
        tests = new UnmodifiableListView<Test>(tests.toList());

  /// Returns a new suite with the given fields updated.
  Suite change({String path, String platform, Metadata metadata,
      Iterable<Test> tests}) {
    if (path == null) path = this.path;
    if (platform == null) platform = this.platform;
    if (metadata == null) metadata = this.metadata;
    if (tests == null) tests = this.tests;
    return new Suite(tests, path: path, platform: platform, metadata: metadata);
  }
}
