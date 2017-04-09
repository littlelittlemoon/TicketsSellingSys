TicketsSellingSys（火车站售票系统）

项目实现简介：

1. 整个项目使用maven来管理jar包之间的依赖，防止jar包冲突
2. 通过Spring整合mybatis和springmvc
3. 通过spring强大的依赖注入功能，通过面向接口编程方式，使bean之间的耦合度降到最低
4. 通过spring的aop面向切面编程对事务进行管理，不用直接操作jdbc
5. 通过mybatis的接口式编程，对数据库进行crud
6. springmvc和spring强大的注解功能也提供了很多便利
7. 前端没有使用传统的jstl标签和el表达式
8. 通过ajax传输json的交互方式进行视图数据的绑定显示
9. 前端框架使用bootstrap，avalonJS和jquery
10. 所有的响应基本属于无状态响应


项目开发者：谭凯悦

用途：成都信息工程大学计算机科学与技术（应用）专业--工程实践五项目设计