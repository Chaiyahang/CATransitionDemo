# CATransitionDemo
 简要展示CATransition的一些动画风格和样式

**动画**

**UIView动画                                                                                                              **

一、属性动画（property Animation）

        改变属性产生的动画

        页面内的动画

二、过渡动画（transition Animation）

       页面间的切换动画

**CoreAnimation动画**

iOS中的动画是由Core Animation 来支撑的，所有动画类都以CA开头

CAAnimation是所有动画类的基类，提供了动画的基本属性和功能（如动画时长等）

CAAnimation有三个子类：CAPropertyAnimation、CATransition、CAAnimationGroup

①CAPropertyAnimation：（属性动画，属性改变产生的动画）

    CAPropertyAnimation有两个子类：CABasicAnimation、   CAKeyframeAnimation

CABasicAnimation：（基本动画，一般是属性从值1到值2产生的动画）

CAKeyframeAnimation：（关键帧动画，一个关键帧动画，通常包括若干个同类型的basicAnimation动画）

②CATransition：（过渡动画，通常是页面间切换时，使用的动画）

③CAAnimationGroup：（允许一组动画同时执行，这些动画一般都是CAPropertyAnimation子类动画）