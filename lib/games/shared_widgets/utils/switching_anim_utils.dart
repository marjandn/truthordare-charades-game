class SwitchingAnimUtils {
  static double getLeftSpaceTopTabBar(
          {required double tabWidth, required int currentPos, required int tabItemsCount}) =>
      currentPos == 0 ? 0 : (tabWidth / tabItemsCount) * currentPos;

  static double getTopTabBarSelectedBoxWidth(
          {required double tabWidth, required int tabItemsCount}) =>
      tabWidth / tabItemsCount;
}
