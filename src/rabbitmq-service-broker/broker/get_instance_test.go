package broker_test

import (
	"context"

	"rabbitmq-service-broker/rabbithutch/fakes"

	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"
	"github.com/pivotal-cf/brokerapi"
)

var _ = Describe("Get Instance", func() {

	var (
		broker      brokerapi.ServiceBroker
		ctx         context.Context
		rabbithutch *fakes.FakeRabbitHutch
	)

	BeforeEach(func() {
		rabbithutch = &fakes.FakeRabbitHutch{}
		broker = defaultServiceBroker(defaultConfig(), rabbithutch)
		ctx = context.TODO()
	})

	It("returns an appropriate error", func() {
		_, err := broker.GetInstance(ctx, "binding-id")
		failResponse, ok := err.(*brokerapi.FailureResponse)
		Expect(ok).To(BeTrue(), "err wasn't a FailureResponse")
		Expect(failResponse.ValidatedStatusCode(nil)).To(Equal(404))
	})
})
