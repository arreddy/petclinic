package org.springframework.roo.petclinic.service.api;
import io.springlets.data.web.validation.ValidatorService;
import io.springlets.format.EntityResolver;
import org.springframework.roo.addon.layers.service.annotations.RooService;
import org.springframework.roo.petclinic.domain.Visit;

/**
 * = VisitService
 *
 * TODO Auto-generated class documentation
 *
 */
@RooService(entity = Visit.class)
public interface VisitService extends EntityResolver<Visit, Long>, ValidatorService<Visit> {
}
