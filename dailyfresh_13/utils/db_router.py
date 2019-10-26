class MasterSlaveDBRouter(object):
    """读写分离路由"""

    def db_for_read(self, model, **hints):
        """读数据库"""
        # 返回的是从服务器的类名，在配置数据库的文件中
        return "slave"

    def db_for_write(self, model, **hints):
        """写数据库"""
        # 返回的是主服务器的类名，在配置数据库的文件中

        return "default"

    def allow_relation(self, obj1, obj2, **hints):
        """是否运行关联操作"""
        # 是否支持关联查询
        return True
