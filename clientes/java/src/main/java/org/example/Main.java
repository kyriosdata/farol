package org.example;

import ca.uhn.fhir.context.FhirContext;
import ca.uhn.fhir.parser.IParser;
import ca.uhn.fhir.rest.api.MethodOutcome;
import ca.uhn.fhir.rest.client.api.IGenericClient;
import ca.uhn.fhir.util.BundleBuilder;
import org.hl7.fhir.r4.model.*;

import java.util.List;
import java.util.UUID;

/**
 * Aplicação que ilustra uso da biblioteca HAPI FHIR
 * para montagem de um Bundle e submissão (criação).
 *
 * <p>AVISO: este código tem o único propósito de ilustrar
 * a biblioteca e a interação com um servidor FHIR.
 * Valores estão "injetados" nos métodos, o que não
 * correspondente a um cenário real.</p>
 */
public class Main {
    public static void main(String[] args) {
        Patient paciente = paciente();
        Reference refpaciente = new Reference();
        refpaciente.setReference("urn:uuid:" + paciente.getIdElement().getIdPart());
        Reference profissional = profissional("1234567");

        Specimen amostra = amostra(profissional, "2024-02-03");
        Observation exame = exameClinico("normal", true, profissional, refpaciente);
        QuestionnaireResponse anamnese = anamnese(profissional, refpaciente);

        ServiceRequest service = serviceRequest(refpaciente, exame, anamnese, amostra);
        Composition composition = composicao(refpaciente, profissional, service.getIdPart());

        FhirContext ctx = FhirContext.forR4();
        BundleBuilder builder = new BundleBuilder(ctx);
        builder.addDocumentEntry(composition);
        Bundle requisicao = (Bundle) builder.getBundle();

        requisicao.addEntry(newEntry(paciente));
        requisicao.addEntry(newEntry(service));
        requisicao.addEntry(newEntry(anamnese));
        requisicao.addEntry(newEntry(exame));

        IParser parser = ctx.newJsonParser().setPrettyPrint(true);
        String json = parser.encodeResourceToString(requisicao);
        System.out.println(json);

        // Criar instância do documento no servidor
        IGenericClient cliente = ctx.newRestfulGenericClient("http://localhost:8080/fhir");
        MethodOutcome outcome = cliente.create().resource(requisicao).execute();
        if (outcome.getCreated()) {
            System.out.println("Bundle criado: " + outcome.getResource().getIdElement());
        } else {
            System.out.println("ERRO. Bundle não foi criado.");
        }

        Parameters in = new Parameters();
        var parametro = in.addParameter();
        parametro.setName("resource");
        parametro.setResource(service);
        Parameters out = cliente.operation().onType("ServiceRequest")
                .named("$validate")
                .withParameters(in)
                .execute();
        System.out.println(parser.encodeResourceToString(out));
    }

    private static Bundle.BundleEntryComponent newEntry(Resource resource) {
        Bundle.BundleEntryComponent entry = new Bundle.BundleEntryComponent();
        entry.setFullUrl("urn:uuid:" + resource.getIdPart());
        entry.setResource(resource);
        return entry;
    }

    private static ServiceRequest serviceRequest(Reference refpaciente, Observation exame, QuestionnaireResponse anamnese, Specimen amostra) {
        ServiceRequest pedido = new ServiceRequest();
        String srId = UUID.randomUUID().toString();
        pedido.setId(srId);

        Meta meta = new Meta();
        meta.addProfile("https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/requisicao-exame-citopatologico");
        pedido.setMeta(meta);

        pedido.setStatus(ServiceRequest.ServiceRequestStatus.ACTIVE);
        pedido.setIntent(ServiceRequest.ServiceRequestIntent.ORDER);

        Coding codingcc = new Coding();
        codingcc.setSystem("http://www.saude.gov.br/fhir/r4/CodeSystem/BRTabelaSUS");
        codingcc.setCode("0203010086");
        CodeableConcept codecc = new CodeableConcept(codingcc);
        pedido.setCode(codecc);

        pedido.setSubject(refpaciente);
        pedido.setRequester(estabelecimento("123456"));

        Coding motivo = new Coding();
        motivo.setSystem("https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/motivo-exame-citopatologico");
        motivo.setCode("rastreamento");
        pedido.addReasonCode(new CodeableConcept(motivo));

        Reference sie = new Reference("urn:uuid:" + exame.getIdPart());
        Reference sia = new Reference("urn:uuid:" + anamnese.getIdPart());
        pedido.addSupportingInfo(sie);
        pedido.addSupportingInfo(sia);

        pedido.addContained(amostra);
        pedido.addSpecimen(new Reference("#" + amostra.getIdPart()));
        return pedido;
    }

    private static Composition composicao(Reference refpaciente, Reference profissional, String srId) {
        Composition composition = new Composition();
        composition.setId(UUID.randomUUID().toString());

        Coding com = new Coding();
        com.setSystem("http://loinc.org");
        com.setCode("47528-5");
        composition.setType(new CodeableConcept(com));

        Coding cat = new Coding();
        cat.setSystem("https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/tipo-documento");
        cat.setCode("requisicao-citopatologico");
        composition.setCategory(List.of(new CodeableConcept(cat)));

        composition.setSubject(refpaciente);
        composition.setDateElement(new DateTimeType("2023-12-13"));

        composition.setAuthor(List.of(profissional));
        composition.setTitle("Requisição de Exame Citopatológico");

        Composition.SectionComponent section = composition.addSection();
        section.addEntry(new Reference("urn:uuid:" + srId));
        return composition;
    }

    public static Patient paciente() {
        Patient subject = new Patient();
        subject.setId(UUID.randomUUID().toString());

        Extension filiacao = subject.addExtension();
        filiacao.setUrl("https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/filiacao");
        filiacao.setValue(new StringType("Cleusa Faria"));

        Extension idade = subject.addExtension();
        idade.setUrl("https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/idade");
        Age age = new Age();
        age.setSystem("http://unitsofmeasure.org");
        age.setValue(26);
        age.setCode("a");
        idade.setValue(age);

        Extension racaEtnia = subject.addExtension();
        racaEtnia.setUrl("https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/raca-etnia");
        Extension raca = racaEtnia.addExtension();
        raca.setUrl("race");
        raca.setValue(new CodeType("01"));

        Extension genero = subject.addExtension();
        genero.setUrl("https://fhir.fabrica.inf.ufg.br/ccu/StructureDefinition/extension-genero");
        Coding codingg = new Coding();
        codingg.setSystem("https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/genero");
        codingg.setCode("201");
        CodeableConcept cg = new CodeableConcept(codingg);
        genero.setValue(cg);

        Identifier cns = new Identifier();
        cns.setSystem("https://fhir.fabrica.inf.ufg.br/ccu/sid/cns");
        cns.setValue("1234567890");

        Identifier cpf = new Identifier();
        cpf.setSystem("https://fhir.fabrica.inf.ufg.br/ccu/sid/cpf");
        cpf.setValue("123.234.443-00");

        subject.addIdentifier(cns);
        subject.addIdentifier(cpf);

        HumanName name = new HumanName();
        name.setUse(HumanName.NameUse.OFFICIAL);
        name.setText("Bruna Faria");

        subject.addName(name);
        subject.setGender(Enumerations.AdministrativeGender.FEMALE);
        subject.setBirthDateElement(new DateType("1997-07-17"));

        return subject;
    }

    public static QuestionnaireResponse anamnese(Reference profissional, Reference paciente) {
        QuestionnaireResponse resp = new QuestionnaireResponse();
        resp.setId(UUID.randomUUID().toString());
        resp.setQuestionnaire("https://fhir.fabrica.inf.ufg.br/ccu/Questionnaire/anamnese-exame-citopatologico");
        resp.setStatus(QuestionnaireResponse.QuestionnaireResponseStatus.COMPLETED);
        resp.setAuthor(profissional);
        resp.setSubject(paciente);

        adicionaItem(resp, "1", simNaoNaoSei(Boolean.TRUE));
        adicionaItem(resp,"2", new DateType("2021"));
        adicionaItem(resp, "3", simNaoNaoSei(Boolean.TRUE));
        adicionaItem(resp, "4", simNaoNaoSei(Boolean.FALSE));
        adicionaItem(resp, "5", simNaoNaoSei(Boolean.TRUE));
        adicionaItem(resp, "6", simNaoNaoSei(Boolean.FALSE));
        adicionaItem(resp, "7", simNaoNaoSei(Boolean.FALSE));
        adicionaItem(resp, "8", new BooleanType(false));
        adicionaItem(resp, "9", new BooleanType(true));
        adicionaItem(resp, "10", new BooleanType(false));
        adicionaItem(resp, "11", new BooleanType(false));

        return resp;
    }

    private static void adicionaItem(QuestionnaireResponse resp, String item, Base valor) {
        var novo = resp.addItem();
        novo.setLinkId(item);
        novo.addAnswer().setProperty("value[x]", valor);
    }

    private static Coding simNaoNaoSei(Boolean resposta) {
        Coding ans = new Coding();
        if (resposta == null) {
            ans.setSystem("http://terminology.hl7.org/CodeSystem/data-absent-reason");
            ans.setCode("asked-unknown");
        } else {
            ans.setSystem("http://terminology.hl7.org/CodeSystem/v2-0136");
            ans.setCode(resposta ? "Y" : "N");
        }

        return ans;
    }

    public static Observation exameClinico(String inspecao, boolean presenca, Reference profissional, Reference paciente) {
        Coding code = new Coding();
        code.setSystem("http://loinc.org");
        code.setCode("32423-6");

        Observation ec = new Observation();
        ec.setId(UUID.randomUUID().toString());
        ec.setSubject(paciente);
        ec.setPerformer(List.of(profissional));
        ec.setEffective(new DateTimeType("2023-12-07"));

        ec.setStatus(Observation.ObservationStatus.FINAL);
        ec.addComponent(newInspecaoColo(inspecao));
        ec.addComponent(newIst(presenca));

        return ec;
    }

    public static Specimen amostra(Reference profissional, String data) {
        Specimen.SpecimenCollectionComponent scc = new Specimen.SpecimenCollectionComponent();
        scc.setCollected(new DateTimeType(data));
        scc.setCollector(profissional);

        Specimen amostra = new Specimen();
        amostra.setId("amostra-requisicao-bruna");
        amostra.setCollection(scc);

        return amostra;
    }

    private static Observation.ObservationComponentComponent newIst(boolean presenca) {
        Coding ci = new Coding();
        ci.setSystem("http://loinc.org");
        ci.setCode("45687-1");
        CodeableConcept cc = new CodeableConcept();
        cc.addCoding(ci);

        Observation.ObservationComponentComponent ist =
                new Observation.ObservationComponentComponent();
        ist.setCode(cc);
        ist.setValue(new BooleanType(presenca));

        return ist;
    }

    private static Observation.ObservationComponentComponent newInspecaoColo(String inspecao) {
        Coding ci = new Coding();
        ci.setSystem("http://loinc.org");
        ci.setCode("12044-4");
        CodeableConcept cc = new CodeableConcept();
        cc.addCoding(ci);

        Coding vc = new Coding();
        vc.setSystem("https://fhir.fabrica.inf.ufg.br/ccu/CodeSystem/resultado-inspecao-colo");
        vc.setCode(inspecao);
        CodeableConcept vi = new CodeableConcept();
        vi.addCoding(vc);

        Observation.ObservationComponentComponent inspecaoColo =
                new Observation.ObservationComponentComponent();
        inspecaoColo.setCode(cc);
        inspecaoColo.setValue(vi);
        return inspecaoColo;
    }

    private static String newUrn() {
        return "urn:uuid:" + UUID.randomUUID();
    }

    private static Reference profissional(String cns) {
        Identifier id = new Identifier();
        id.setSystem("https://fhir.fabrica.inf.ufg.br/ccu/sid/cpf");
        id.setValue(cns);

        Reference ref = new Reference();
        ref.setIdentifier(id);

        return ref;
    }

    private static Reference estabelecimento(String cnes) {
        Identifier id = new Identifier();
        id.setSystem("https://fhir.fabrica.inf.ufg.br/ccu/sid/cnes");
        id.setValue(cnes);

        Reference ref = new Reference();
        ref.setIdentifier(id);

        return ref;
    }
}