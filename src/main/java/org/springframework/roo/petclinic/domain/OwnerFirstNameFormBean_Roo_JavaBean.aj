// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.springframework.roo.petclinic.domain;

import org.springframework.roo.petclinic.domain.OwnerFirstNameFormBean;

privileged aspect OwnerFirstNameFormBean_Roo_JavaBean {
    
    /**
     * Gets firstName value
     * 
     * @return String
     */
    public String OwnerFirstNameFormBean.getFirstName() {
        return this.firstName;
    }
    
    /**
     * Sets firstName value
     * 
     * @param firstName
     * @return OwnerFirstNameFormBean
     */
    public OwnerFirstNameFormBean OwnerFirstNameFormBean.setFirstName(String firstName) {
        this.firstName = firstName;
        return this;
    }
    
}
