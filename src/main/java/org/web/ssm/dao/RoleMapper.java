package org.web.ssm.dao;

import org.web.ssm.model.Role;

public interface RoleMapper {
    Role selectByPrimaryKey(String roleid);
}
