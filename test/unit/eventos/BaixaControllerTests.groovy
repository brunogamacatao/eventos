package eventos



import org.junit.*
import grails.test.mixin.*

@TestFor(BaixaController)
@Mock(Baixa)
class BaixaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/baixa/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.baixaInstanceList.size() == 0
        assert model.baixaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.baixaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.baixaInstance != null
        assert view == '/baixa/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/baixa/show/1'
        assert controller.flash.message != null
        assert Baixa.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/baixa/list'

        populateValidParams(params)
        def baixa = new Baixa(params)

        assert baixa.save() != null

        params.id = baixa.id

        def model = controller.show()

        assert model.baixaInstance == baixa
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/baixa/list'

        populateValidParams(params)
        def baixa = new Baixa(params)

        assert baixa.save() != null

        params.id = baixa.id

        def model = controller.edit()

        assert model.baixaInstance == baixa
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/baixa/list'

        response.reset()

        populateValidParams(params)
        def baixa = new Baixa(params)

        assert baixa.save() != null

        // test invalid parameters in update
        params.id = baixa.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/baixa/edit"
        assert model.baixaInstance != null

        baixa.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/baixa/show/$baixa.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        baixa.clearErrors()

        populateValidParams(params)
        params.id = baixa.id
        params.version = -1
        controller.update()

        assert view == "/baixa/edit"
        assert model.baixaInstance != null
        assert model.baixaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/baixa/list'

        response.reset()

        populateValidParams(params)
        def baixa = new Baixa(params)

        assert baixa.save() != null
        assert Baixa.count() == 1

        params.id = baixa.id

        controller.delete()

        assert Baixa.count() == 0
        assert Baixa.get(baixa.id) == null
        assert response.redirectedUrl == '/baixa/list'
    }
}
