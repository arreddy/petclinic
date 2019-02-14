package org.springframework.roo.petclinic.service.api;
import io.springlets.data.web.validation.ValidatorService;
import io.springlets.format.EntityResolver;
import org.springframework.roo.addon.layers.service.annotations.RooService;
import org.springframework.roo.petclinic.domain.Owner;

/**
 * = OwnerService
 *
 * TODO Auto-generated class documentation
 *
 */
@RooService(entity = Owner.class)
public interface OwnerService extends EntityResolver<Owner, Long>, ValidatorService<Owner> {
}
