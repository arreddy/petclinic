package org.springframework.roo.petclinic.service.api;
import io.springlets.data.web.validation.ValidatorService;
import io.springlets.format.EntityResolver;
import org.springframework.roo.addon.layers.service.annotations.RooService;
import org.springframework.roo.petclinic.domain.Vet;

/**
 * = VetService
 *
 * TODO Auto-generated class documentation
 *
 */
@RooService(entity = Vet.class)
public interface VetService extends EntityResolver<Vet, Long>, ValidatorService<Vet> {
}
