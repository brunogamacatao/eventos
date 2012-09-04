package eventos



import org.junit.*
import grails.test.mixin.*

@TestFor(ParticipanteController)
@Mock(Participante)
class ParticipanteControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/participante/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.participanteInstanceList.size() == 0
        assert model.participanteInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.participanteInstance != null
    }

    void testSave() {
        controller.save()

        assert model.participanteInstance != null
        assert view == '/participante/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/participante/show/1'
        assert controller.flash.message != null
        assert Participante.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/participante/list'

        populateValidParams(params)
        def participante = new Participante(params)

        assert participante.save() != null

        params.id = participante.id

        def model = controller.show()

        assert model.participanteInstance == participante
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/participante/list'

        populateValidParams(params)
        def participante = new Participante(params)

        assert participante.save() != null

        params.id = participante.id

        def model = controller.edit()

        assert model.participanteInstance == participante
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/participante/list'

        response.reset()

        populateValidParams(params)
        def participante = new Participante(params)

        assert participante.save() != null

        // test invalid parameters in update
        params.id = participante.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/participante/edit"
        assert model.participanteInstance != null

        participante.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/participante/show/$participante.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        participante.clearErrors()

        populateValidParams(params)
        params.id = participante.id
        params.version = -1
        controller.update()

        assert view == "/participante/edit"
        assert model.participanteInstance != null
        assert model.participanteInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/participante/list'

        response.reset()

        populateValidParams(params)
        def participante = new Participante(params)

        assert participante.save() != null
        assert Participante.count() == 1

        params.id = participante.id

        controller.delete()

        assert Participante.count() == 0
        assert Participante.get(participante.id) == null
        assert response.redirectedUrl == '/participante/list'
    }
}
