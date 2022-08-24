/*
 * Copyright © 2020, Simform Solutions
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice, this
 *    list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import 'package:flutter/material.dart';

class GetPosition {
  final GlobalKey key;
  final double height;

  GetPosition({this.key, this.height = 0});

  Rect getRect() {
    RenderBox box = key.currentContext.findRenderObject();

    final topLeft = box.size.topLeft(box.localToGlobal(const Offset(0.0, 0.0)));
    final bottomRight =
        box.size.bottomRight(box.localToGlobal(const Offset(0.0, 0.0)));
    double bottomRightHeight = bottomRight.dy;
    if (this.height > 0) {
      bottomRightHeight += this.height;
    }

    Rect rect = Rect.fromLTRB(
      topLeft.dx,
      topLeft.dy,
      bottomRight.dx,
      bottomRightHeight,
    );
    return rect;
  }

  ///Get the bottom position of the widget
  double getBottom() {
    RenderBox box = key.currentContext.findRenderObject();
    final bottomRight =
        box.size.bottomRight(box.localToGlobal(const Offset(0.0, 0.0)));
    return bottomRight.dy;
  }

  ///Get the top position of the widget
  double getTop() {
    RenderBox box = key.currentContext.findRenderObject();
    final topLeft = box.size.topLeft(box.localToGlobal(const Offset(0.0, 0.0)));
    return topLeft.dy;
  }

  ///Get the left position of the widget
  double getLeft() {
    RenderBox box = key.currentContext.findRenderObject();
    final topLeft = box.size.topLeft(box.localToGlobal(const Offset(0.0, 0.0)));
    return topLeft.dx;
  }

  ///Get the right position of the widget
  double getRight() {
    RenderBox box = key.currentContext.findRenderObject();
    final bottomRight =
        box.size.bottomRight(box.localToGlobal(const Offset(0.0, 0.0)));
    return bottomRight.dx;
  }

  double getHeight() {
    return getBottom() - getTop();
  }

  double getWidth() {
    return getRight() - getLeft();
  }

  double getCenter() {
    return (getLeft() + getRight()) / 2;
  }
}
