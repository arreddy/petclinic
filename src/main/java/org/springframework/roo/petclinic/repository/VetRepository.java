package org.springframework.roo.petclinic.repository;
import io.springlets.data.jpa.repository.DetachableJpaRepository;
import org.springframework.roo.addon.layers.repository.jpa.annotations.RooJpaRepository;
import org.springframework.roo.petclinic.domain.Vet;
import org.springframework.roo.petclinic.domain.VetInfo;

/**
 * = VetRepository
 *
 * TODO Auto-generated class documentation
 *
 */
@RooJpaRepository(entity = Vet.class, defaultReturnType = VetInfo.class)
public interface VetRepository extends DetachableJpaRepository<Vet, Long>, VetRepositoryCustom {
}
