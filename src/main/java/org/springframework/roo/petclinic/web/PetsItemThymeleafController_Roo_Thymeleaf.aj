// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.springframework.roo.petclinic.web;

import io.springlets.data.web.validation.GenericValidator;
import io.springlets.web.NotFoundException;
import io.springlets.web.mvc.util.ControllerMethodLinkBuilderFactory;
import io.springlets.web.mvc.util.MethodLinkBuilderFactory;
import io.springlets.web.mvc.util.concurrency.ConcurrencyCallback;
import io.springlets.web.mvc.util.concurrency.ConcurrencyManager;
import io.springlets.web.mvc.util.concurrency.ConcurrencyTemplate;
import java.util.Arrays;
import java.util.Locale;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.petclinic.domain.Pet;
import org.springframework.roo.petclinic.domain.reference.PetType;
import org.springframework.roo.petclinic.service.api.PetService;
import org.springframework.roo.petclinic.web.PetsCollectionThymeleafController;
import org.springframework.roo.petclinic.web.PetsItemThymeleafController;
import org.springframework.roo.petclinic.web.PetsItemThymeleafLinkFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponents;

privileged aspect PetsItemThymeleafController_Roo_Thymeleaf {
    
    declare @type: PetsItemThymeleafController: @Controller;
    
    declare @type: PetsItemThymeleafController: @RequestMapping(value = "/pets/{pet}", name = "PetsItemThymeleafController", produces = MediaType.TEXT_HTML_VALUE);
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private PetService PetsItemThymeleafController.petService;
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private MessageSource PetsItemThymeleafController.messageSource;
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private MethodLinkBuilderFactory<PetsItemThymeleafController> PetsItemThymeleafController.itemLink;
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private MethodLinkBuilderFactory<PetsCollectionThymeleafController> PetsItemThymeleafController.collectionLink;
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private final ConcurrencyTemplate<Pet> PetsItemThymeleafController.concurrencyTemplate = new ConcurrencyTemplate<Pet>(this);
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param petService
     * @param messageSource
     * @param linkBuilder
     */
    @Autowired
    public PetsItemThymeleafController.new(PetService petService, MessageSource messageSource, ControllerMethodLinkBuilderFactory linkBuilder) {
        setPetService(petService);
        setMessageSource(messageSource);
        setItemLink(linkBuilder.of(PetsItemThymeleafController.class));
        setCollectionLink(linkBuilder.of(PetsCollectionThymeleafController.class));
    }

    /**
     * TODO Auto-generated method documentation
     * 
     * @return PetService
     */
    public PetService PetsItemThymeleafController.getPetService() {
        return petService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param petService
     */
    public void PetsItemThymeleafController.setPetService(PetService petService) {
        this.petService = petService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return MessageSource
     */
    public MessageSource PetsItemThymeleafController.getMessageSource() {
        return messageSource;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param messageSource
     */
    public void PetsItemThymeleafController.setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return MethodLinkBuilderFactory
     */
    public MethodLinkBuilderFactory<PetsItemThymeleafController> PetsItemThymeleafController.getItemLink() {
        return itemLink;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param itemLink
     */
    public void PetsItemThymeleafController.setItemLink(MethodLinkBuilderFactory<PetsItemThymeleafController> itemLink) {
        this.itemLink = itemLink;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return MethodLinkBuilderFactory
     */
    public MethodLinkBuilderFactory<PetsCollectionThymeleafController> PetsItemThymeleafController.getCollectionLink() {
        return collectionLink;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param collectionLink
     */
    public void PetsItemThymeleafController.setCollectionLink(MethodLinkBuilderFactory<PetsCollectionThymeleafController> collectionLink) {
        this.collectionLink = collectionLink;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @param locale
     * @param method
     * @return Pet
     */
    @ModelAttribute
    public Pet PetsItemThymeleafController.getPet(@PathVariable("pet") Long id, Locale locale, HttpMethod method) {
        Pet pet = null;
        if (HttpMethod.PUT.equals(method)) {
            pet = petService.findOneForUpdate(id);
        } else {
            pet = petService.findOne(id);
        }
        
        if (pet == null) {
            String message = messageSource.getMessage("error_NotFound", new Object[] {"Pet", id}, "The record couldn't be found", locale);
            throw new NotFoundException(message);
        }
        return pet;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param pet
     * @param model
     * @return ModelAndView
     */
    @GetMapping(name = "show")
    public ModelAndView PetsItemThymeleafController.show(@ModelAttribute Pet pet, Model model) {
        model.addAttribute("pet", pet);
        return new ModelAndView("pets/show");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param pet
     * @param model
     * @return ModelAndView
     */
    @GetMapping(value = "/inline", name = "showInline")
    public ModelAndView PetsItemThymeleafController.showInline(@ModelAttribute Pet pet, Model model) {
        model.addAttribute("pet", pet);
        return new ModelAndView("pets/showInline :: inline-content");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     */
    public void PetsItemThymeleafController.populateFormats(Model model) {
        model.addAttribute("application_locale", LocaleContextHolder.getLocale().getLanguage());
        model.addAttribute("createdDate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        model.addAttribute("modifiedDate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     */
    public void PetsItemThymeleafController.populateForm(Model model) {
        populateFormats(model);
        model.addAttribute("type", Arrays.asList(PetType.values()));
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return ConcurrencyTemplate
     */
    public ConcurrencyTemplate<Pet> PetsItemThymeleafController.getConcurrencyTemplate() {
        return concurrencyTemplate;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return String
     */
    public String PetsItemThymeleafController.getModelName() {
        return "pet";
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return String
     */
    public String PetsItemThymeleafController.getEditViewPath() {
        return "pets/edit";
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param record
     * @return Integer
     */
    public Integer PetsItemThymeleafController.getLastVersion(Pet record) {
        return getPetService().findOne(record.getId()).getVersion();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param entity
     * @param model
     * @return ModelAndView
     */
    public ModelAndView PetsItemThymeleafController.populateAndGetFormView(Pet entity, Model model) {
        // Populate the form with all the necessary elements
        populateForm(model);
        // Add concurrency attribute to the model to show the concurrency form
        // in the current edit view
        model.addAttribute("concurrency", true);
        // Add the new version value to the model.
        model.addAttribute("newVersion", getLastVersion(entity));
        // Add the current pet values to maintain the values introduced by the user
        model.addAttribute(getModelName(), entity);
        // Return the edit view path
        return new org.springframework.web.servlet.ModelAndView(getEditViewPath(), model.asMap());
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param binder
     */
    @InitBinder("pet")
    public void PetsItemThymeleafController.initPetBinder(WebDataBinder binder) {
        binder.setDisallowedFields("id");
        // Register validators
        GenericValidator validator = new GenericValidator(Pet.class, getPetService());
        binder.addValidators(validator);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param pet
     * @param model
     * @return ModelAndView
     */
    @GetMapping(value = "/edit-form", name = "editForm")
    public ModelAndView PetsItemThymeleafController.editForm(@ModelAttribute Pet pet, Model model) {
        populateForm(model);
        
        model.addAttribute("pet", pet);
        return new ModelAndView("pets/edit");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param pet
     * @param result
     * @param version
     * @param concurrencyControl
     * @param model
     * @return ModelAndView
     */
    @PutMapping(name = "update")
    public ModelAndView PetsItemThymeleafController.update(@Valid @ModelAttribute Pet pet, BindingResult result, @RequestParam("version") Integer version, @RequestParam(value = "concurrency", required = false, defaultValue = "") String concurrencyControl, Model model) {
        // Check if provided form contain errors
        if (result.hasErrors()) {
            populateForm(model);
            return new ModelAndView(getEditViewPath());
        }
        // Create Concurrency Spring Template to ensure that the following code will manage the
        // possible concurrency exceptions that appears and execute the provided coded inside the Spring template.
        // If some concurrency exception appears the template will manage it.
        Pet savedPet = getConcurrencyTemplate().execute(pet, model, new ConcurrencyCallback<Pet>() {
            @Override
            public Pet doInConcurrency(Pet pet) throws Exception {
                return getPetService().save(pet);
            }
        });
        UriComponents showURI = getItemLink().to(PetsItemThymeleafLinkFactory.SHOW).with("pet", savedPet.getId()).toUri();
        return new ModelAndView("redirect:" + showURI.toUriString());
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param pet
     * @return ResponseEntity
     */
    @ResponseBody
    @DeleteMapping(name = "delete")
    public ResponseEntity<?> PetsItemThymeleafController.delete(@ModelAttribute Pet pet) {
        getPetService().delete(pet);
        return ResponseEntity.ok().build();
    }
    
}
