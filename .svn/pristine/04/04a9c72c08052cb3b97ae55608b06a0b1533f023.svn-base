package eventos



import org.junit.*
import grails.test.mixin.*

@TestFor(OpcaoController)
@Mock(Opcao)
class OpcaoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/opcao/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.opcaoInstanceList.size() == 0
        assert model.opcaoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.opcaoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.opcaoInstance != null
        assert view == '/opcao/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/opcao/show/1'
        assert controller.flash.message != null
        assert Opcao.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/opcao/list'

        populateValidParams(params)
        def opcao = new Opcao(params)

        assert opcao.save() != null

        params.id = opcao.id

        def model = controller.show()

        assert model.opcaoInstance == opcao
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/opcao/list'

        populateValidParams(params)
        def opcao = new Opcao(params)

        assert opcao.save() != null

        params.id = opcao.id

        def model = controller.edit()

        assert model.opcaoInstance == opcao
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/opcao/list'

        response.reset()

        populateValidParams(params)
        def opcao = new Opcao(params)

        assert opcao.save() != null

        // test invalid parameters in update
        params.id = opcao.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/opcao/edit"
        assert model.opcaoInstance != null

        opcao.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/opcao/show/$opcao.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        opcao.clearErrors()

        populateValidParams(params)
        params.id = opcao.id
        params.version = -1
        controller.update()

        assert view == "/opcao/edit"
        assert model.opcaoInstance != null
        assert model.opcaoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/opcao/list'

        response.reset()

        populateValidParams(params)
        def opcao = new Opcao(params)

        assert opcao.save() != null
        assert Opcao.count() == 1

        params.id = opcao.id

        controller.delete()

        assert Opcao.count() == 0
        assert Opcao.get(opcao.id) == null
        assert response.redirectedUrl == '/opcao/list'
    }
}
