package org.springframework.roo.petclinic.service.api;
import io.springlets.data.web.validation.ValidatorService;
import io.springlets.format.EntityResolver;
import org.springframework.roo.addon.layers.service.annotations.RooService;
import org.springframework.roo.petclinic.domain.Pet;

/**
 * = PetService
 *
 * TODO Auto-generated class documentation
 *
 */
@RooService(entity = Pet.class)
public interface PetService extends EntityResolver<Pet, Long>, ValidatorService<Pet> {
}
