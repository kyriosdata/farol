package org.example;

import ca.uhn.fhir.context.FhirContext;
import ca.uhn.fhir.model.base.composite.BaseCodingDt;
import ca.uhn.fhir.parser.IParser;
import ca.uhn.fhir.util.BundleBuilder;
import org.hl7.fhir.r4.model.*;
import org.hl7.fhir.r4.utils.CodingUtilities;
import org.hl7.fhir.r4.utils.ResourceUtilities;

import java.util.List;
import java.util.UUID;

public class Main {
    public static void main(String[] args) {
        FhirContext ctx = FhirContext.forR4();
        Patient paciente = paciente();
        Specimen amostra = amostra("1234-5678", "2024-02-03");


        ServiceRequest pedido = new ServiceRequest();
        var uriType = new UriType(UUID.randomUUID().toString());
        var id = uriType.getId();
        pedido.setId(id);
        Composition composition = new Composition();
        Composition.SectionComponent section = composition.addSection();
        section.addEntry(new Reference(pedido));

        Bundle.BundleEntryComponent entry = new Bundle.BundleEntryComponent();
        entry.setFullUrl(newUrn());
        entry.setResource(composition);
        BundleBuilder builder = new BundleBuilder(ctx);
        Bundle requisicao = (Bundle) builder.getBundle();
        requisicao.addEntry(entry);

        IParser parser = ctx.newJsonParser().setPrettyPrint(true);

        var exame = exameClinico("normal", true);
        Reference refPaciente = new Reference();
        refPaciente.setReference("urn:uuid:" + paciente.getIdElement().getIdPart());
        exame.setSubject(refPaciente);

        String json = parser.encodeResourceToString(anamnese());
        System.out.println(json);
    }

    public static QuestionnaireResponse anamnese() {
        QuestionnaireResponse resp = new QuestionnaireResponse();
        resp.setQuestionnaire("https://fhir.fabrica.inf.ufg.br/ccu/Questionnaire/anamnese-exame-citopatologico");
        resp.setStatus(QuestionnaireResponse.QuestionnaireResponseStatus.COMPLETED);

        var item1 = resp.addItem();
        var answerItem1 = item1.addAnswer();

        Coding coding = new Coding();
        coding.setSystem("http://question.com/www");
        coding.setCode("code");

        answerItem1.setProperty("value[x]", coding);

        return resp;
    }

    private Coding answerSimNaoNaoSei(Boolean resposta) {
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

    public static Observation exameClinico(String inspecao, boolean presenca) {
        Coding code = new Coding();
        code.setSystem("http://loinc.org");
        code.setCode("32423-6");

        Observation ec = new Observation();
        ec.setPerformer(List.of(profissional("1234567")));
        ec.setEffective(new DateTimeType("2023-12-07"));

        ec.setStatus(Observation.ObservationStatus.FINAL);
        ec.addComponent(newInspecaoColo(inspecao));
        ec.addComponent(newIst(presenca));

        return ec;
    }

    public static Specimen amostra(String cpf, String data) {
        Identifier responsavel = new Identifier();
        responsavel.setSystem("https://fhir.fabrica.inf.ufg.br/ccu/sid/cpf");
        responsavel.setValue(cpf);

        Reference responsavelColeta = new Reference();
        responsavelColeta.setIdentifier(responsavel);

        Specimen.SpecimenCollectionComponent scc = new Specimen.SpecimenCollectionComponent();
        scc.setCollected(new DateTimeType(data));
        scc.setCollector(responsavelColeta);

        Specimen amostra = new Specimen();
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
        id.setSystem("http://fhir.fabrica.inf.ufg.br/ccu/sid/cns");
        id.setValue(cns);

        Reference ref = new Reference();
        ref.setIdentifier(id);

        return ref;
    }

    private static Patient paciente() {
        Patient subject = new Patient();
        subject.setId(UUID.randomUUID().toString());
        return subject;
    }
}