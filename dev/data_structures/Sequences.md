# Sequences
序列

序列是生成唯一整数值的结构。

[SQL-DEMO-Sequences](../../scripts/dev/data_structures/sequence.sql)

序列的CURRVAL是发送给当前会话的上一个值，不一定是发出的上一个值。直到选择了NEXTVAL后才能选择CURRVAL。

递增序列不需要提交，不能被回滚。

## 修改序列的注意事项

- 必须是序列的拥有者或对序列有 ALTER 权限
- 只有将来的序列值会被改变
- 改变序列的初始值只能通过删除序列之后重建序列的方法实现
- ALTER命名不能设置起始值
- 其它的一些限制

