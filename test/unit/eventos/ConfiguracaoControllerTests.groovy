package eventos



import org.junit.*
import grails.test.mixin.*

@TestFor(ConfiguracaoController)
@Mock(Configuracao)
class ConfiguracaoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/configuracao/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.configuracaoInstanceList.size() == 0
        assert model.configuracaoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.configuracaoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.configuracaoInstance != null
        assert view == '/configuracao/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/configuracao/show/1'
        assert controller.flash.message != null
        assert Configuracao.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/configuracao/list'

        populateValidParams(params)
        def configuracao = new Configuracao(params)

        assert configuracao.save() != null

        params.id = configuracao.id

        def model = controller.show()

        assert model.configuracaoInstance == configuracao
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/configuracao/list'

        populateValidParams(params)
        def configuracao = new Configuracao(params)

        assert configuracao.save() != null

        params.id = configuracao.id

        def model = controller.edit()

        assert model.configuracaoInstance == configuracao
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/configuracao/list'

        response.reset()

        populateValidParams(params)
        def configuracao = new Configuracao(params)

        assert configuracao.save() != null

        // test invalid parameters in update
        params.id = configuracao.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/configuracao/edit"
        assert model.configuracaoInstance != null

        configuracao.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/configuracao/show/$configuracao.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        configuracao.clearErrors()

        populateValidParams(params)
        params.id = configuracao.id
        params.version = -1
        controller.update()

        assert view == "/configuracao/edit"
        assert model.configuracaoInstance != null
        assert model.configuracaoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/configuracao/list'

        response.reset()

        populateValidParams(params)
        def configuracao = new Configuracao(params)

        assert configuracao.save() != null
        assert Configuracao.count() == 1

        params.id = configuracao.id

        controller.delete()

        assert Configuracao.count() == 0
        assert Configuracao.get(configuracao.id) == null
        assert response.redirectedUrl == '/configuracao/list'
    }
}
