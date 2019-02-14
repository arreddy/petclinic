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
import java.util.Locale;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.petclinic.domain.Owner;
import org.springframework.roo.petclinic.service.api.OwnerService;
import org.springframework.roo.petclinic.web.OwnersCollectionThymeleafController;
import org.springframework.roo.petclinic.web.OwnersItemThymeleafController;
import org.springframework.roo.petclinic.web.OwnersItemThymeleafLinkFactory;
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

privileged aspect OwnersItemThymeleafController_Roo_Thymeleaf {
    
    declare @type: OwnersItemThymeleafController: @Controller;
    
    declare @type: OwnersItemThymeleafController: @RequestMapping(value = "/owners/{owner}", name = "OwnersItemThymeleafController", produces = MediaType.TEXT_HTML_VALUE);
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private OwnerService OwnersItemThymeleafController.ownerService;
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private MessageSource OwnersItemThymeleafController.messageSource;
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private MethodLinkBuilderFactory<OwnersItemThymeleafController> OwnersItemThymeleafController.itemLink;
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private MethodLinkBuilderFactory<OwnersCollectionThymeleafController> OwnersItemThymeleafController.collectionLink;
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private final ConcurrencyTemplate<Owner> OwnersItemThymeleafController.concurrencyTemplate = new ConcurrencyTemplate<Owner>(this);
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param ownerService
     * @param messageSource
     * @param linkBuilder
     */
    @Autowired
    public OwnersItemThymeleafController.new(OwnerService ownerService, MessageSource messageSource, ControllerMethodLinkBuilderFactory linkBuilder) {
        setOwnerService(ownerService);
        setMessageSource(messageSource);
        setItemLink(linkBuilder.of(OwnersItemThymeleafController.class));
        setCollectionLink(linkBuilder.of(OwnersCollectionThymeleafController.class));
    }

    /**
     * TODO Auto-generated method documentation
     * 
     * @return OwnerService
     */
    public OwnerService OwnersItemThymeleafController.getOwnerService() {
        return ownerService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ownerService
     */
    public void OwnersItemThymeleafController.setOwnerService(OwnerService ownerService) {
        this.ownerService = ownerService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return MessageSource
     */
    public MessageSource OwnersItemThymeleafController.getMessageSource() {
        return messageSource;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param messageSource
     */
    public void OwnersItemThymeleafController.setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return MethodLinkBuilderFactory
     */
    public MethodLinkBuilderFactory<OwnersItemThymeleafController> OwnersItemThymeleafController.getItemLink() {
        return itemLink;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param itemLink
     */
    public void OwnersItemThymeleafController.setItemLink(MethodLinkBuilderFactory<OwnersItemThymeleafController> itemLink) {
        this.itemLink = itemLink;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return MethodLinkBuilderFactory
     */
    public MethodLinkBuilderFactory<OwnersCollectionThymeleafController> OwnersItemThymeleafController.getCollectionLink() {
        return collectionLink;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param collectionLink
     */
    public void OwnersItemThymeleafController.setCollectionLink(MethodLinkBuilderFactory<OwnersCollectionThymeleafController> collectionLink) {
        this.collectionLink = collectionLink;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @param locale
     * @param method
     * @return Owner
     */
    @ModelAttribute
    public Owner OwnersItemThymeleafController.getOwner(@PathVariable("owner") Long id, Locale locale, HttpMethod method) {
        Owner owner = null;
        if (HttpMethod.PUT.equals(method)) {
            owner = ownerService.findOneForUpdate(id);
        } else {
            owner = ownerService.findOne(id);
        }
        
        if (owner == null) {
            String message = messageSource.getMessage("error_NotFound", new Object[] {"Owner", id}, "The record couldn't be found", locale);
            throw new NotFoundException(message);
        }
        return owner;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param owner
     * @param model
     * @return ModelAndView
     */
    @GetMapping(name = "show")
    public ModelAndView OwnersItemThymeleafController.show(@ModelAttribute Owner owner, Model model) {
        model.addAttribute("owner", owner);
        return new ModelAndView("owners/show");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param owner
     * @param model
     * @return ModelAndView
     */
    @GetMapping(value = "/inline", name = "showInline")
    public ModelAndView OwnersItemThymeleafController.showInline(@ModelAttribute Owner owner, Model model) {
        model.addAttribute("owner", owner);
        return new ModelAndView("owners/showInline :: inline-content");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     */
    public void OwnersItemThymeleafController.populateFormats(Model model) {
        model.addAttribute("application_locale", LocaleContextHolder.getLocale().getLanguage());
        model.addAttribute("birthDay_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        model.addAttribute("createdDate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        model.addAttribute("modifiedDate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     */
    public void OwnersItemThymeleafController.populateForm(Model model) {
        populateFormats(model);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return ConcurrencyTemplate
     */
    public ConcurrencyTemplate<Owner> OwnersItemThymeleafController.getConcurrencyTemplate() {
        return concurrencyTemplate;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return String
     */
    public String OwnersItemThymeleafController.getModelName() {
        return "owner";
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return String
     */
    public String OwnersItemThymeleafController.getEditViewPath() {
        return "owners/edit";
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param record
     * @return Integer
     */
    public Integer OwnersItemThymeleafController.getLastVersion(Owner record) {
        return getOwnerService().findOne(record.getId()).getVersion();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param entity
     * @param model
     * @return ModelAndView
     */
    public ModelAndView OwnersItemThymeleafController.populateAndGetFormView(Owner entity, Model model) {
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
    @InitBinder("owner")
    public void OwnersItemThymeleafController.initOwnerBinder(WebDataBinder binder) {
        binder.setDisallowedFields("id");
        // Register validators
        GenericValidator validator = new GenericValidator(Owner.class, getOwnerService());
        binder.addValidators(validator);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param owner
     * @param model
     * @return ModelAndView
     */
    @GetMapping(value = "/edit-form", name = "editForm")
    public ModelAndView OwnersItemThymeleafController.editForm(@ModelAttribute Owner owner, Model model) {
        populateForm(model);
        
        model.addAttribute("owner", owner);
        return new ModelAndView("owners/edit");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param owner
     * @param result
     * @param version
     * @param concurrencyControl
     * @param model
     * @return ModelAndView
     */
    @PutMapping(name = "update")
    public ModelAndView OwnersItemThymeleafController.update(@Valid @ModelAttribute Owner owner, BindingResult result, @RequestParam("version") Integer version, @RequestParam(value = "concurrency", required = false, defaultValue = "") String concurrencyControl, Model model) {
        // Check if provided form contain errors
        if (result.hasErrors()) {
            populateForm(model);
            return new ModelAndView(getEditViewPath());
        }
        // Create Concurrency Spring Template to ensure that the following code will manage the
        // possible concurrency exceptions that appears and execute the provided coded inside the Spring template.
        // If some concurrency exception appears the template will manage it.
        Owner savedOwner = getConcurrencyTemplate().execute(owner, model, new ConcurrencyCallback<Owner>() {
            @Override
            public Owner doInConcurrency(Owner owner) throws Exception {
                return getOwnerService().save(owner);
            }
        });
        UriComponents showURI = getItemLink().to(OwnersItemThymeleafLinkFactory.SHOW).with("owner", savedOwner.getId()).toUri();
        return new ModelAndView("redirect:" + showURI.toUriString());
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param owner
     * @return ResponseEntity
     */
    @ResponseBody
    @DeleteMapping(name = "delete")
    public ResponseEntity<?> OwnersItemThymeleafController.delete(@ModelAttribute Owner owner) {
        getOwnerService().delete(owner);
        return ResponseEntity.ok().build();
    }
    
}
