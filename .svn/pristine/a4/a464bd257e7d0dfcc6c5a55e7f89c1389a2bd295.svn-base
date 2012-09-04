package eventos



import org.junit.*
import grails.test.mixin.*

@TestFor(TituloController)
@Mock(Titulo)
class TituloControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/titulo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tituloInstanceList.size() == 0
        assert model.tituloInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.tituloInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tituloInstance != null
        assert view == '/titulo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/titulo/show/1'
        assert controller.flash.message != null
        assert Titulo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/titulo/list'

        populateValidParams(params)
        def titulo = new Titulo(params)

        assert titulo.save() != null

        params.id = titulo.id

        def model = controller.show()

        assert model.tituloInstance == titulo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/titulo/list'

        populateValidParams(params)
        def titulo = new Titulo(params)

        assert titulo.save() != null

        params.id = titulo.id

        def model = controller.edit()

        assert model.tituloInstance == titulo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/titulo/list'

        response.reset()

        populateValidParams(params)
        def titulo = new Titulo(params)

        assert titulo.save() != null

        // test invalid parameters in update
        params.id = titulo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/titulo/edit"
        assert model.tituloInstance != null

        titulo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/titulo/show/$titulo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        titulo.clearErrors()

        populateValidParams(params)
        params.id = titulo.id
        params.version = -1
        controller.update()

        assert view == "/titulo/edit"
        assert model.tituloInstance != null
        assert model.tituloInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/titulo/list'

        response.reset()

        populateValidParams(params)
        def titulo = new Titulo(params)

        assert titulo.save() != null
        assert Titulo.count() == 1

        params.id = titulo.id

        controller.delete()

        assert Titulo.count() == 0
        assert Titulo.get(titulo.id) == null
        assert response.redirectedUrl == '/titulo/list'
    }
}
