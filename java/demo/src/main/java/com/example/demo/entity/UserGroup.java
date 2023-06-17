package com.example.demo.entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

@Entity
@Table(name="users_groups")
@IdClass(value=StudentKey.class)
public class UserGroup {
    @Id
    @Column(name="user_id")
    private String user_id;

    @Id
    @Column(name="group_id")
    private UUID group_id;
}
